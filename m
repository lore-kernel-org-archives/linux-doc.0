Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE37343D75;
	Wed,  1 Jul 2026 14:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915546; cv=none; b=Est/yaH/RQl42RZnhB36uhCxMjSQ8U0P7x2d0usTEUHQxjMaviLOPP2X1eeVqF6tzYJGt0h0ss3qG968WmJDECIYNjT7KJwAf79APdQuzRu8De8EKXgUmR8mZmG7zw7C3qGoQ2SWaIZyfWptct+zTthZAS85IZF9W1AX4xpUhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915546; c=relaxed/simple;
	bh=RvR2U4ecz0xrbMHjk5maJ5Fx6sW/La41FvsQ+pJ0I4U=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=qPVe4Odk2vJXP1PfJCHvZas5vu6zGBwXGqW1i1byJ6O2Rru/1xhomlOfoGQZJelV4CPMoCnvXgOZiMObrTISpPeVBL8esKlEGblvKm3jmrNZW200Trg0AAyj8QmF5RdJp4A9gNMYU5ms2Wxh7U2ynoE4Ws4eGqU/fGUxTByz/0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gr2FK5Pftz5B109;
	Wed, 01 Jul 2026 22:19:01 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 661EIs1q000143;
	Wed, 1 Jul 2026 22:18:54 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 1 Jul 2026 22:18:57 +0800 (CST)
X-Zmail-TransId: 2af96a4521d1cb0-8f438
X-Mailer: Zmail v1.0
Message-ID: <202607012218574761db7fGjm1svTfeCoKtrIX@zte.com.cn>
In-Reply-To: <20260701123430.20699-1-lukas.gerlach@cispa.de>
References: f75d286c-4d9e-4b64-8a9e-03e1afcb509f@kernel.org,20260701123430.20699-1-lukas.gerlach@cispa.de
Date: Wed, 1 Jul 2026 22:18:57 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <lukas.gerlach@cispa.de>, <akpm@linux-foundation.org>, <david@kernel.org>
Cc: <akpm@linux-foundation.org>, <corbet@lwn.net>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <chengming.zhou@linux.dev>, <skhan@linuxfoundation.org>,
        <lukas.gerlach@cispa.de>, <jo.vanbulck@cs.kuleuven.be>,
        <tristan.hornetz@cispa.de>, <michael.schwarz@cispa.de>,
        <shukai.ni@kuleuven.be>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gbW0va3NtOiBkb2N1bWVudCBzaWRlLWNoYW5uZWwgc2VjdXJpdHkgY29uc2lkZXJhdGlvbnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 661EIs1q000143
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 01 Jul 2026 22:19:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4521D5.000/4gr2FK5Pftz5B109

> Subject: [PATCH] mm/ksm: document side-channel security considerations
> Date: Wed, 1 Jul 2026 14:34:30 +0200	[thread overview]
> Message-ID: <20260701123430.20699-1-lukas.gerlach@cispa.de> (raw)
> In-Reply-To: <f75d286c-4d9e-4b64-8a9e-03e1afcb509f@kernel.org>
> 
> KSM is known to enable side channels, but the admin guide does not
> currently spell out the security implications of enabling page merging.
> Because KSM merges pages by content across all processes with mergeable
> memory, it forms a side channel that can be used to infer the contents
> of that memory across security domains, regardless of the user,
> container, or virtual machine the pages belong to.
> 
> Add a "Security considerations" section making this explicit, so that
> operators can make an informed decision: KSM should only be enabled for
> mutually trusting workloads, and any memory marked mergeable should be
> assumed readable by every other process using KSM.
> 
> Co-developed-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
> Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
> Cc: Tristan Hornetz <tristan.hornetz@cispa.de>
> Cc: Michael Schwarz <michael.schwarz@cispa.de>
> Cc: Shukai Ni <shukai.ni@kuleuven.be>
> ---
> Hi David,
> 
> Thanks for the quick response.
> 
> I generally agree. The issue I see is that the current documentation
> understates the risk. The RHEL documentation ("could be potentially
> used to leak information across guests") does not read like enabling
> KSM is an arbitrary read across VMs, which the side channel we
> disclosed (in contrast to previous works) is. So the documentation
> should really state that KSM is only an option for mutually trusted
> workloads. A clean model for this would be to assume that memory
> marked as mergeable is readable by everyone else using KSM.
> 
> Patch below to clarify this in the admin guide. We would, in the
> future, publish a paper on this to further raise awareness of the
> risks involved with KSM.

It seems you have discovered a new information leakage attack method,
and we look forward to reading your paper. Meanwhile, we are currently
researching a domain-isolated KSM-merge and mechanism to defend against
similar attacks.

The following statement is essentially factual and deserve being documented.

Reviewed-by: Xu Xin <xu.xin16@zte.com.cn>

> 
> Greetings,
> Lukas
> 
>  Documentation/admin-guide/mm/ksm.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> index ad8e7a41f3b5..cbd5f2fdcfcb 100644
> --- a/Documentation/admin-guide/mm/ksm.rst
> +++ b/Documentation/admin-guide/mm/ksm.rst
> @@ -27,6 +27,23 @@ KSM's merged pages were originally locked into kernel memory, but can now
>  be swapped out just like other user pages (but sharing is broken when they
>  are swapped back in: ksmd must rediscover their identity and merge again).
> 
> +Security considerations
> +=======================
> +
> +Because KSM merges pages based on their content, across all processes
> +with mergeable memory regardless of which user, container, or virtual
> +machine they belong to, it exposes a side channel that can be used to
> +infer the contents of mergeable memory across security domains.  Users
> +should assume that any memory marked mergeable is readable by every
> +other process using KSM.
> +
> +KSM should therefore only be enabled for mutually trusted workloads, or
> +where the merged data is not sensitive; in particular, merging pages
> +across mutually untrusted virtual machines or tenants is not secure.
> +KSM is disabled by default (``run`` is 0).  Applications and VMMs that
> +use ``MADV_MERGEABLE`` should limit it to regions that do not hold
> +secrets.
> +
>  Controlling KSM with madvise
>  ============================

The above statement is essentially factual and deserve being documented.
