function [likelihood,beta_gradient] = single_beta_TD(beta_n,delta,student,lam)
%a function to return the conditional Log Likelihood and its gradient, for estimating the student abilities when the delta values
%are already known
    r=sum(student);
    [a,iTest]=size(delta);
    x=beta_n-delta;
    likelihood=-beta_n*r+student*delta'+sum(log(1+exp(x)))+lam*beta_n*beta_n;
    beta_gradient=-r+sum(ones(1,iTest)./(1+exp(-x)))+2*lam*beta_n;
end

% def Conditional_Log_Likelihood(beta_n,delta,student,lam):
%     r=sum(student)
%     x=np.array([beta_n-j for j in delta])
%     L=beta_n*r-student.dot(delta)-sum(np.log(1+np.exp(x)))#+regularization???
%           #+lam*w.T.dot(w)+b.T.dot(wDelta)
%     return L
%     r=sum(student)
%     x=np.array([beta_n-j for j in delta])
%     grad=r-sum(scipy.special.expit(x))#+regularization
%     return grad