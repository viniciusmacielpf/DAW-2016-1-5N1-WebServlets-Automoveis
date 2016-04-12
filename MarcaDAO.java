package br.edu.ifsul.dao;

import br.edu.ifsul.jpa.EntityManagerUtil;
import br.edu.ifsul.modelo.Marca;
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
public class MarcaDAO {

    private Marca objetoSelecionado;
    private String mensagem = ""; 
    private EntityManager em;

    public MarcaDAO() {
        em = EntityManagerUtil.getEntityManager();
    }

    public boolean validaObjeto(Marca obj) {
        Validator validador = Validation.buildDefaultValidatorFactory().getValidator();

        Set<ConstraintViolation<Marca>> erros = validador.validate(obj);
        if (erros.size() > 0) {
            mensagem = "";
            mensagem += "Objeto com erros \n ";
            for (ConstraintViolation<Marca> erro : erros) {
                mensagem += "erro>" + erro.getMessage() + "<br>";
            }
            return false;
        } else {
            return true;
        }
    }

    public List<Marca> getLista() {
        return em.createQuery(" from Marca order by nome").getResultList();
    }

    public boolean salvar(Marca obj) {
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
    public Marca localizar(Integer id){
        return em.find(Marca.class,id);
    }
    public boolean remover(Marca obj) { 
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

    public Marca getObjetoSelecionado() {
        return objetoSelecionado;
    }

    public void setObjetoSelecionado(Marca objetoSeleciona) {
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
