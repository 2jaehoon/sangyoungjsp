package kr.co.sist.vo;

import java.sql.Date;

public class EmpVO {
	private int empno, sal, deptno;
	private String ename, job;
	private Date hiredate;
	
	public EmpVO(int empno, int sal, int deptno, String ename, String job, Date hiredate) {
		this.empno = empno;
		this.sal = sal;
		this.deptno = deptno;
		this.ename = ename;
		this.job = job;
		this.hiredate = hiredate;
	}
	
	
	public EmpVO() {
		
	}


	public int getEmpno() {
		return empno;
	}


	public void setEmpno(int empno) {
		this.empno = empno;
	}


	public int getSal() {
		return sal;
	}


	public void setSal(int sal) {
		this.sal = sal;
	}


	public int getDeptno() {
		return deptno;
	}


	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}


	public String getEname() {
		return ename;
	}


	public void setEname(String ename) {
		this.ename = ename;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public Date getHiredate() {
		return hiredate;
	}


	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}


	@Override
	public String toString() {
		return "EmpVO [empno=" + empno + ", sal=" + sal + ", deptno=" + deptno + ", ename=" + ename + ", job=" + job
				+ ", hiredate=" + hiredate + "]";
	}

	
}
