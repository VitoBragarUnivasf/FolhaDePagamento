package projeto.esii;
import java.util.Scanner;


public class FolhaPagamento {
    private String formapagamento;


    public String getFormapagamento() {
        return formapagamento;
    }

    public void setFormapagamento(String formapagamento) {
        this.formapagamento = formapagamento;
    }
    
    public void InsereFormaPagamento(){
        Scanner input = new Scanner(System.in);
      
        System.out.println("Qual a forma de Pagamento desejada?");
        String s = input.next();
        this.setFormapagamento(s);
    }
    
    
    public void InfoFolhaP(Funcionario func,Imposto fgts,Imposto inss){
        InsereFormaPagamento();
        System.out.println("INFORMAÇÕES DO FUNCIONARIO");
        System.out.println("Funcionario: %s",Funcionario.Nome_F);
        System.out.println("Setor: %s",Funcionario.Setor_F);
        System.out.println("Cpf: %i",Funcionario.Cpf_F);
        System.out.println("Pis: %i",Funcionario.Pis_F);
        System.out.println("Endereço: %s",Funcionario.Endereço_F);
        System.out.println("Contato: (%i)%i",Funcionario.DDD_F,Funcionario.Telefone_F);
        System.out.println("INFORMAÇÕES SOBRE O PAGAMENTO");
        System.out.println("Dia do Pagamento:  %d/%d/%d",func.dia,func.mes,func.ano);
        System.out.println("Salario Bruto: %f",func.salario);
        System.out.println("Dedução do INSS:  %f",CalcularFgts(func,inss));
        System.out.println("Dedução do FGTS:  %f",CalcularFgts(func,fgts));
        System.out.println("Salario Liquido:  %f",);
        System.out.println("Forma de Pagamento Escolhida: %s",this.getFormapagamento());
    }
    
    public float CalcularFgts(Funcionario func,Imposto fgts){
        float salcfgts;
        salcfgts= func.salario - func.salario*fgts;
        return salcfgts;
    }
    public float CalcularInss(Funcionario func,Imposto inss){
        float salcinss;
        salcinss=func.salario-func.salario*inss;
        return salcinss;
    }
}
