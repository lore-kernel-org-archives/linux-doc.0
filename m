Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F7F47D45A
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 04:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865394; cv=none; b=G8Z1ffJ4NW6ZxyL0NIHwRuew68Mvma4oOGc6oo4SkC9lqFPWH39lpmh6F2SpZdll6g/2M29l6jRjzfX/A8vKlNl9Lkpar8hmjSIq3mlCnMW0VAjYvTb9O8/czFg/5O2L/hKucoByDMOwgyi0z7zSClHUyLFwg8dr40HgijLsk9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865394; c=relaxed/simple;
	bh=0xkcXtEYaB9KYHNXsnL5BpaXh6cLF1hHL7akJ1DFKGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTvX3jc6iSUt9tTjA78eQqvRluw1XbGwPaOEd2zqel/NgyYTbXie/qz3zytKbMWlyVuQGXSI2lbf5FyaH1OFUrIq105mLPMjSN8Q0/ScS+wCIBpfYknrGe9XyujIvaNY18/GqxGfszf/TpWc/pyTgHsPtnB03Z9W6Nt/VNKPMOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHpQvQCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RE7yheHl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHpQvQCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RE7yheHl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3xO9b3476214
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 04:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tIWfgspxx4yLynby3ZQs1PnM
	reRTHqVlMg0z9Olk6BY=; b=YHpQvQCPqfZF1nBZx8vPKI+1i3dzN09Aillf0/C2
	aXW/AkCeJBshshO3wyeKJZx/WnpZNxOP88LUoGfPopp0/1IDO/NaKADVq6HC3msQ
	m0b/T3DpxLTE83HIloKjnaUgj16ORMSyT/P6omuoqnbv/14nUGtCbtCsrB4VIISE
	yLmerKoUcLvsnSEDlmoehOB6+xIdQecm7VkRQYSWP3nUyVVUVZOPDpr/5DyVem5C
	4HycyzpFEvjOWLwlzl4HHifH7WUl/SRQrXHIkUgsCdBwwp06csA0eqpyi31xD6WL
	Bj1FVDMIqdCgZnju841EMUSxRsO9yUUdouAKumM4Umesqg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j82fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 04:23:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5199786eec.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 21:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791865391; x=1792470191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIWfgspxx4yLynby3ZQs1PnMreRTHqVlMg0z9Olk6BY=;
        b=RE7yheHlV9fKa7D7okSiO3j+iQHQ8nj2BTujDy5OFZwokKeJaGqQ7QUw5pA6xzP+29
         HU8z59IV7A94JHlOthcEr1VA0yipVrURCGxPD3rCL82jjeZC4nNsBOjTGzcljqYhqvIb
         WwpVXFU+95nNVtdNL5fFxhreKv9B9TVfAywSgC2WAiDCERHBd2sLB0u73hE0WRdopcas
         hwa0bsCs/Y/mPY6SNKCM60sOWnhAhSeemGPCKMtjmQAsoy6c2JK8e3s1S3ajwlrqnU/K
         r8Yhi1/zoDt7HX0atb115VRDa5gv9vlGd4ZINnqkqaTmV+tiyqDyAwJu8N6sn38rL8Y3
         xFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865391; x=1792470191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIWfgspxx4yLynby3ZQs1PnMreRTHqVlMg0z9Olk6BY=;
        b=BSdEGmKwi9yTVV7p8KdFCgNd+0suY+bi8JKVRPfJX4wnq2Sqjf2Yu6BUdAkzCAjAgu
         SnbKMG/7BoVe8rv0fAHXsmYUBGZqAOZMpfgY3HBvSq3kZGXkdlEGHE1y3djU3CJWAwF0
         yop3Ar7aLigXrFWI1T/y1D5pl0P9Nr9W/EiKy3XwYkI06jCI3J5Yp84/+F97lPI0tYpy
         LTti/IHBktGlYY4bpa4XPngD1rb2g4zdTWXkkzKP8tPCGe98OCXuTW3OoisFlIRle2nC
         MRJg8SBTXtM2G4peKYRA9HtkRrR47fm3WbrKErlhAUjfpG3JgpYRwOCewB2xlOyFkk3P
         SSEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcBM+mIJZy6hMd5Igt14H2FZtExfxq+OchWJJHMmeTKn4azPyaPPY5X5TJFSlKJxjFU5JoHiq1ctQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/0Wlrdf5q3NrUpocOs2zCFXSn/7eO06/VXEF7K50X55yqKUOG
	cNd3BQp42YAjmEwnteXMtwPqZT6/njrl25pS+eMJtixKX8OzKkdFzKH1s3xlb5NlSUavj5TDg42
	wsl67m8lQEmTc5pud5AHeGrKvIrRk0MfA1DRylV8AsCGtzGdho78qCyw2/3xV7rk=
X-Gm-Gg: AYBFou2LbelMIHhfI13LWHaILvFYF5A2s3+n/tq+AiThM2ywLKmuNJAJs6wMbwbDMJU
	vIc5MGuv7aI4LZR0rQKRQ7QOQ+TGzfS0T0pkjk+jkrFAK65ypC0ilm02qzKkGGVdfl80hPRPkD3
	eULRSYNGiSgvawqZUTOvQeWwRLd05j27irOKtZkwbNh0XAgW1fNtbWnFtKcawyQUvfSwQXwdnCe
	txTd4GZw5M4Ia8pxGBPv43xJ8WG4RYZf/SKgW+S2y88vGbXEcj6Kc5io4RX48tiSbkFQSv64Wx5
	NjTMzxBf7x9cMRwcWz8ApfeNH22cgzgcJEOqzOgrFPLpsojUyh8BpzL8nK+DubVmI4w0pcGaVU5
	FCjsoWR0L3rPZ9XA4y+TDRLYPzkigvLD77eVVxQDyrQ/XSwv7DEy6NKYa5BRaBgQjakH5ebDoR/
	xhOaks41qtnsD1/lGa1BWZgPA=
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2695287eec.11.1791865390850;
        Mon, 12 Oct 2026 21:23:10 -0700 (PDT)
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2695237eec.11.1791865390214;
        Mon, 12 Oct 2026 21:23:10 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm1999530eec.23.2026.10.12.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:23:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:52:57 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
        Yuanzhu <yuanzhu@bytedance.com>,
        Yicong Yang <yang.yicong@picoheart.com>,
        Susheng Yang <yang.susheng@zte.com.cn>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 RESEND 3/9] riscv: sse: mask events during shutdown
 and kexec
Message-ID: <as2yIcM4YJlbvMPu@hu-himchau-blr.qualcomm.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
 <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-GUID: pngMBLir-NS4b5OnlhVUyoPR5h-tsDeC
X-Proofpoint-ORIG-GUID: pngMBLir-NS4b5OnlhVUyoPR5h-tsDeC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxNyBTYWx0ZWRfX5btuKm5zwZm3
 eYPpk9iMEYyv3pxzrdzhNCU0y+00WoN/878dr29DrjYXVSd01rq+93H4OnSNUx/gRUppnl/peNx
 iPvgq0OGj1ua7YZuiVCtXuvYw6E1GJM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxNyBTYWx0ZWRfX2+cnslfYkKh/
 QOt6xQ6h0xzCEQ5K2O4ZgJVnYR7VfpQ6Un5/J/vj6aaEB9WZi4MXZn6rMX/IcwwTvXjIFQ0p2mk
 fmX9H2n4w9bn9QRfC/OrnoIuxjRf/adlbBVlIIhKW7mPD6+5lsfZdee7FhQYkptwJFOepss+67t
 zTWaPJadNC9eLKvOkd9K05xHQA0AlmhdffQwFLD8CpqxYR7dbvJYzPK10i1IItbKOBw56MlmWig
 RvStw18o8gDeFKdBD/IW6T5RFJ6Z9sPeIOekEi7qhJGFw6hnHgjRNvpfpI2Z1/NCHEF5YnwaQ0S
 NEr2p+s62plWN+/Ntuna11JQsqD7GlS6TjjSqyVZt79Up3kvb6VmaTydSlhBi8JkF03xMlc3kLD
 16ImPehnQhS1adS5b71vsT9J85DJQ2cbqNPbcOadUD9cCJEJXAI9gJTgAPrQxZVQAuhsfNQg1o8
 QmBvYdu+BpKN+g48QLw==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdb22f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=a_nq2awA8k5mFBtTUooA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130017

On Mon, Sep 21, 2026 at 07:15:00PM +0800, Zhanpeng Zhang wrote:
> SSE delivery is independent of normal S-mode interrupts. Firmware may also
> retain an event registration until Linux explicitly unregisters it. A hart
> must therefore stop accepting SSE events before Linux stops servicing the
> registered handler.
> 
> Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
> and crash shutdown paths. This prevents firmware from entering Linux-owned
> handler state after the corresponding CPU or kernel context is no longer
> valid.
> 
> A crash kernel cannot identify or take ownership of registrations
> inherited from the crashed kernel. Reject a later normal kexec while such
> SSE state may still exist, rather than transferring unknown firmware state
> to another kernel.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>  arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 738df176ff6f..24e7affae70b 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -14,10 +14,13 @@
>  #include <asm/set_memory.h>	/* For set_memory_x() */
>  #include <linux/compiler.h>	/* For unreachable() */
>  #include <linux/cpu.h>		/* For cpu_down() */
> +#include <linux/crash_dump.h>
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  
> +#include <asm/sse.h>
> +
>  /*
>   * machine_kexec_prepare - Initialize kexec
>   *
> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>  	unsigned int control_code_buffer_sz = 0;
>  	int i = 0;
>  
> +	/* A crash kernel cannot tear down registrations inherited from firmware. */
> +	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
> +	    riscv_sse_available()) {
> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i = 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <= sizeof(fdt))
> @@ -127,6 +137,7 @@ void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> +	riscv_sse_mask_current_hart();
>  
>  	/* shutdown non-crashing cpus */
>  	crash_smp_send_stop();
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 14eb08a6db85..fdab37e7ae52 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -6,6 +6,20 @@
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
> +
> +#include <asm/sse.h>
> +
> +#ifndef CONFIG_SMP
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +#endif
>  
>  static void __noreturn default_power_off(void)
>  {
> @@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	riscv_sse_mask_current_hart();
> +
>  	/*
>  	 * UpdateCapsule() depends on the system being reset via ResetSystem().
>  	 */
> @@ -30,12 +46,14 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index fa66f9c97d74..7f0d4e7332f1 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -23,10 +23,13 @@
>  #include <linux/irq.h>
>  #include <linux/irq_work.h>
>  #include <linux/nmi.h>
> +#include <linux/panic.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  
>  enum ipi_message_type {
>  	IPI_RESCHEDULE,
> @@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
>  	return -ENOENT;
>  }
>  
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +
>  static void ipi_stop(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	set_cpu_online(smp_processor_id(), false);
>  	while (1)
>  		wait_for_interrupt();
> @@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>  
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
> +	riscv_sse_mask_current_hart();
>  	crash_save_cpu(regs, cpu);
>  
>  	atomic_dec(&waiting_for_crash_ipi);
> @@ -254,6 +268,8 @@ void smp_send_stop(void)
>  {
>  	unsigned long timeout;
>  
> +	riscv_sse_mask_current_hart();
> +
>  	if (num_online_cpus() > 1) {
>  		cpumask_t mask;
>  
> @@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
>  		return;
>  
>  	cpus_stopped = 1;
> +	riscv_sse_mask_current_hart();
>  
>  	/*
>  	 * If this cpu is the only one alive at this point in time, online or

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

> -- 
> 2.50.1 (Apple Git-155)
> 
