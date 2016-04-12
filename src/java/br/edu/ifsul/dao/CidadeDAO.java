package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Cidade;
import br.edu.ifsul.util.Util;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

/**
 *
 * @author Vini
 *
 */
public class CidadeDAO {

    private Cidade objetoSelecionado;
    private String mensagem = "";
    private EntityManager em;

    public CidadeDAO() {
        em = EntityManagerUtil.getEntityManager();
    }

    public boolean validaObjeto(Cidade obj) {
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();

        Set<ConstraintViolation<Cidade>> erros = validador.validate(obj);
        if (erros.size() > 0) {
            mensagem = "";
            mensagem += "Objeto com erros \n ";
            for (ConstraintViolation<Cidade> erro : erros) {
                mensagem += "erro>" + erro.getMessage() + "<br>";
            }
            return false;
        } else {
            return true;
        }
    }

    public List<Cidade> getLista() {
        return em.createQuery(" from Cidade order by nome").getResultList();
    }

    public boolean salvar(Cidade obj) {
        try {
            em.getTransaction().begin();
            if (obj.getId() == null) {
                em.persist(obj);
            } else {
                em.merge(obj);
            }
             mensagem = "Salvo com sucesso";
            em.getTransaction().commit();
            return true;

        } catch (Exception e) {
            if (em.getTransaction().isActive() == false) {
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "erro ao persistir :" + Util.getMensagemErro(e);
            return false;
        }
    }
    public Cidade localizar(Integer id){
        return em.find(Cidade.class,id);
    }
    public boolean remover(Cidade obj) {
        try {
            em.getTransaction().begin();
            em.remove(obj);
            em.getTransaction().commit();
            mensagem = "Removido com sucesso";
            return true;

        } catch (Exception e) {
            if (em.getTransaction().isActive() == false) {
                em.getTransaction().begin();
            }
            em.getTransaction().rollback();
            mensagem = "erro ao excluir :" + Util.getMensagemErro(e);
            return false;
        }
    }

    public Cidade getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Cidade objetoSeleciona) {
        this.objetoSelecionado = objetoSeleciona;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

    public EntityManager getEm() {
        return em;
    }

    public void setEm(EntityManager em) {
        this.em = em;
    }
}
