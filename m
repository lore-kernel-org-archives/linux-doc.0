Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66F93CB2E6;
	Fri, 10 Apr 2026 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775830666; cv=none; b=LJdJ62p+HicTKAiwdqNcmSB1sL7rn8Q/vIRF3ELIQNytapOKd0ZhU+RuwoA1ZcfDGjKHnu8m3qcNNVcDymFMZ443qeYoS0Oa6UmhRYrIf+GW0WyQmoPURbcTwl4atuTpROTWiZD5+xvucpLrImg9cP+ST/pcu3juTeUM/Eg5sRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775830666; c=relaxed/simple;
	bh=MWQbDbKJMvlQeDOdpwjVFPm2GwVeWyzLpiS7dX7cf6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qhb8wBnjQT4Zpb/Q2ib6yHS9q+/P5cAiamuqze4VVvFCWcqrlKxjEp4mTVEAJ58yyI/PsXNRLh9wbbBuvFlMsB7PRpypbHuhE79u1DrWVdRd7wUpU76i8Y/XXx0cbdphQQEIhuQM52osXZ09nv7bjxLZ6imsy+JA8RzTkfNEuU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=g6Xv4FLB; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="g6Xv4FLB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=89sWGO8AlV20Ohsw4OJI0G4LNPOoHNZD3rE29wrdmss=; b=g6Xv4FLBo75hPgXI5PonFAm1Qj
	dc83hN9ROemoVz8Mh5e301Yv0LtveH0BO8ylQjQ/4kp5vnMegzwI5L5+jycI+nbyyJ74gg3ye0w0n
	NfMcPYbuihg0xGddTYlBK06M9Yzmd6bRPV8TdaRVRJm/Mzy7lvvJeiZVmwGozVUI6I+TArha+pSkH
	tUc6VEmTjcyLxgLITU87MIISC8HPx768iLoPUNCfR/SMouxsoXz4gghQnuBX1vnOS6vr01qo9n0l+
	40vavz2p2jb14SuazfTHSvaHfpQZzdNarTOQvcM+6A22Sm4gWiiQbfQRReQRLVxjHoguhe5o6IbW2
	O6OR726g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wBCfy-00A2JE-1B;
	Fri, 10 Apr 2026 14:17:38 +0000
Date: Fri, 10 Apr 2026 07:17:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
Message-ID: <adkFQF7QH8Jc3p3U@gmail.com>
References: <20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org>
 <20260331-ecc_panic-v2-2-9e40d0f64f7a@debian.org>
 <59c133a7-74a7-4678-d907-add764bbd107@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59c133a7-74a7-4678-d907-add764bbd107@huawei.com>
X-Debian-User: leitao

On Tue, Apr 07, 2026 at 10:57:36AM +0800, Miaohe Lin wrote:
> On 2026/3/31 19:00, Breno Leitao wrote:
> > +	if (sysctl_panic_on_unrecoverable_mf && result == MF_IGNORED &&
> > +	    (type == MF_MSG_KERNEL || type == MF_MSG_KERNEL_HIGH_ORDER ||
> > +	     type == MF_MSG_UNKNOWN))
> > +		panic("Memory failure: %#lx: unrecoverable page", pfn);
> 
> Will it be better to add a helper here?

Yes, a helper would make things easier to read and digest. Thanks for
the feedback. This is what I have in mind:

commit 36d5b3cbbe6d6abfe3296b7b21135a5f01e743eb
Author: Breno Leitao <leitao@debian.org>
Date:   Mon Mar 23 08:00:29 2026 -0700

    mm/memory-failure: add panic_on_unrecoverable_memory_failure sysctl
    
    Add a sysctl that allows the system to panic when an unrecoverable
    memory failure is detected. This covers kernel pages, high-order
    kernel pages, and unknown page types that cannot be recovered.
    
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 6ff80e01b91a4..a29b6688fe2d3 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -74,6 +74,8 @@ static int sysctl_memory_failure_recovery __read_mostly = 1;
 
 static int sysctl_enable_soft_offline __read_mostly = 1;
 
+static int sysctl_panic_on_unrecoverable_mf __read_mostly;
+
 atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
 
 static bool hw_memory_failure __read_mostly = false;
@@ -155,6 +157,15 @@ static const struct ctl_table memory_failure_table[] = {
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
+	},
+	{
+		.procname	= "panic_on_unrecoverable_memory_failure",
+		.data		= &sysctl_panic_on_unrecoverable_mf,
+		.maxlen		= sizeof(sysctl_panic_on_unrecoverable_mf),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
 	}
 };
 
@@ -1281,6 +1292,16 @@ static void update_per_node_mf_stats(unsigned long pfn,
 	++mf_stats->total;
 }
 
+static bool is_unrecoverable_memory_failure(enum mf_action_page_type type,
+					    enum mf_result result)
+{
+	return sysctl_panic_on_unrecoverable_mf &&
+	       result == MF_IGNORED &&
+	       (type == MF_MSG_KERNEL ||
+		type == MF_MSG_KERNEL_HIGH_ORDER ||
+		type == MF_MSG_UNKNOWN);
+}
+
 /*
  * "Dirty/Clean" indication is not 100% accurate due to the possibility of
  * setting PG_dirty outside page lock. See also comment above set_page_dirty().
@@ -1298,6 +1319,9 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
 	pr_err("%#lx: recovery action for %s: %s\n",
 		pfn, action_page_types[type], action_name[result]);
 
+	if (is_unrecoverable_memory_failure(type, result))
+		panic("Memory failure: %#lx: unrecoverable page", pfn);
+
 	return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
 }
 
