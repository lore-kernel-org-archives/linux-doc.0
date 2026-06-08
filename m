Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E934D926;
	Mon,  8 Jun 2026 17:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938050; cv=none; b=MdzCy4XZPkcHjW7kNx2nUYfmAGLnNWvwu1PrEkIbuYsjn06G6Z+OMnGOeLgXQ0e+F5AkLgd2FEltEohcQ/PJfVPbqBdlwKEI6Ea43pZdrOpWiqVrVhOFLFQG3y17ajSZ3pNJo8LmEKCn0FHEjEegq+IWjTKrczaeJbYXOuOxww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938050; c=relaxed/simple;
	bh=JWekfpsZz5h/QErnwdC/wJCzqFBNNG5Bowrb7e7vlLk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gCLb3dK9t6IH0Us1YgwDTp2vHwCsqy2rVb6mNHSVTynX+pRqRewGFw86qslqMNo2RkdalARt1DsrzavFGIznxa/p85AtSk2pHQZQKr0sK1U+U+OoOFf6ZT8GxbhOBw3hCh6qrIgvOBUK+LOEKa0c/naNHp9rlZ7/TVdbV+Q7oR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AG7Xumms; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AG7Xumms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3F11F00898;
	Mon,  8 Jun 2026 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780938048;
	bh=qJZ+gEHeHchtF8KdGs3IA+qO6tgK2R53bEDXm7pTX8k=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=AG7XummsOP1iQ1B2WqhqSBCBxKdxBVQoXCsF6eLhR7ooVu3fc9oLDceM8IaFGml3v
	 vZOemai8wdylzpCCrMwXY4ZxXEKcUSJpm986VZoKa10/0beyPIjTkfCs0xA64IS5Ec
	 oOztnmYZMdJT8HsWFlBqJY7FvZg8MzVGy1/QTWQldaudX+P1/ZzXdomlxv/LL/Bz4Z
	 nA714EiFXuBcK+y02qTJdfiNE0T3eIEUKWVYJdXht6kIlHsq/PyYeKavQJFyft1w3b
	 rOxLgmI7ETQD5w/evj/FW2l7jBnCIrjmrgn0p5xwdBpWm8AMC1/KmrUX6mMzfFP7GK
	 d7SsZOkKIgfXw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8BA20F40071;
	Mon,  8 Jun 2026 13:00:47 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 08 Jun 2026 13:00:47 -0400
X-ME-Sender: <xms:P_UmamVN6MrO7gTo8mDADblkznX7H6e1KaeSB2CBGo-hsYCaEk5sFw>
    <xme:P_UmataFHOUnh8hmi8Mjit5NsaZJoHl2ITAmyqSKHfdiBSNIhYGOwgzH6LeAPFei_
    tT8XN-92J-QU_h-Tmg2ZtxIuv2mfh0csxP9LV7suQ2GuPhEN3NxLEw>
X-ME-Proxy-Cause: dmFkZTFIrs0rbUTFUt9Ea9ObZOnrEKCaE5zTCuDovBv/QZv326/tNPHs8dA1MkZWvEsi+f
    OSDKPCimGe1aHHbI+N0HekBphl0I0TytnXkM+Ad+vgC/PIFT9wgOTOvdO1esuTnICa+OyI
    98VOYkCJU4GNz7r5rc4hmJezXiCPQp8gaME5Ni7P7oxnHCvjwkGjb83kQF/1hlhyKsnztQ
    KseTiQORNdlu+/dAJMv6XTzOCYlKybt8jkyhrNfgLcYLfOTSnn64aD9rSljk9J5p1LWxKL
    VAhiLAvF9sE0zLFjqt1ax9tguQQD34uqIdHEqjh4vFCWBiEIg2xUwwz6kUPx0fthS8DRCj
    iSZdUaaIvWf0FXN3fBCNsI+Hc5ZAQrbEf82ApTG+gnPDJQRP18dspBqH+ooO+GoG/ojSJc
    X75rA3GzYFbuKTyBUcyQYNy2uUSY2rx6FdXJa3nwXUysb83foMtHOX8FdTEgv3T34MMzzq
    vrJ+Celnea75n3YDo0beYNbu0j8cZoIbDRrQ0F2XbklCXggvmipdp0KGaRQQyb7WoC/aFm
    AnX/N7bsTmE3/0fE5y9M69TngXnyObX6Ep1JnJ8RACnfjeN75JOJTzPuiObB+TEWvCpHmy
    hozpp8YPoxgKYpMqBsnI9iYxQgAENtpKc6Xn8G/6+WMSTzfMFBcQuLIC4Hmw
X-ME-Proxy: <xmx:P_Umah-54ImWXvjGmsOUg3GK1maNdEyhOT-ztZShtkklhaT2L8shjA>
    <xmx:P_UmasxC8OWCnAHwo1URANIiFXXguKbes146qV8VUsFZvYR-KXWkxA>
    <xmx:P_UmamvaKUkpAmPOkrrZDHBir__0HeVc0KHRGRtfKW-heMJCXX3EgQ>
    <xmx:P_Umar3VwK_X-ocqBv-fc-0qRgTEPw2-luMAF0ZaEr47sfz86IQJoQ>
    <xmx:P_Umai7dGIS6BmUBmyt6QxFCxUXI-sqsfYj892ddLNKwN_F1qgshYFTe>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5F544780070; Mon,  8 Jun 2026 13:00:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AjyxdYx9oHls
Date: Mon, 08 Jun 2026 13:00:27 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Jeff Layton" <jlayton@kernel.org>,
 "Chuck Lever" <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>,
 "Olga Kornievskaia" <okorniev@redhat.com>, "Dai Ngo" <Dai.Ngo@oracle.com>,
 "Tom Talpey" <tom@talpey.com>, "Trond Myklebust" <trondmy@kernel.org>,
 "Anna Schumaker" <anna@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>
Cc: "Steven Rostedt" <rostedt@goodmis.org>,
 "Alexander Aring" <alex.aring@gmail.com>,
 "Amir Goldstein" <amir73il@gmail.com>, "Jan Kara" <jack@suse.cz>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>,
 "Calum Mackay" <calum.mackay@oracle.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-nfs@vger.kernel.org
Message-Id: <a01b83d8-1767-4220-a845-075bcac1cc84@app.fastmail.com>
In-Reply-To: <20260522-dir-deleg-v5-8-542cddfad576@kernel.org>
References: <20260522-dir-deleg-v5-0-542cddfad576@kernel.org>
 <20260522-dir-deleg-v5-8-542cddfad576@kernel.org>
Subject: Re: [PATCH v5 08/21] nfsd: use RCU to protect fi_deleg_file
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, May 22, 2026, at 3:42 PM, Jeff Layton wrote:
> fi_deleg_file can be NULLed by put_deleg_file() when fi_delegees drops
> to zero during delegation teardown (e.g. DELEGRETURN). Concurrent
> accesses from workqueue callbacks -- such as CB_NOTIFY -- can
> dereference a NULL pointer if they race with this teardown.

> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 3efc53f0dde6..bd0517dfe881 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -1212,7 +1212,9 @@ static void put_deleg_file(struct nfs4_file *fp)
> 
>  	spin_lock(&fp->fi_lock);
>  	if (--fp->fi_delegees == 0) {
> -		swap(nf, fp->fi_deleg_file);
> +		nf = rcu_dereference_protected(fp->fi_deleg_file,
> +					       lockdep_is_held(&fp->fi_lock));
> +		rcu_assign_pointer(fp->fi_deleg_file, NULL);

Nit: For consistency, the above could be
RCU_INIT_POINTER(fp->fi_deleg_file, NULL);


>  		swap(rnf, fp->fi_rdeleg_file);
>  	}
>  	spin_unlock(&fp->fi_lock);

> @@ -9722,7 +9729,7 @@ nfsd_get_dir_deleg(struct nfsd4_compound_state 
> *cstate,
>  	}
> 
>  	/* Something failed. Drop the lease and clean up the stid */
> -	kernel_setlease(fp->fi_deleg_file->nf_file, F_UNLCK, NULL, (void **)&dp);
> +	kernel_setlease(nf->nf_file, F_UNLCK, NULL, (void **)&dp);
>  out_put_stid:
>  	nfs4_put_stid(&dp->dl_stid);
>  out_delegees:

We might want:

        kernel_setlease(rcu_dereference_protected(fp->fi_deleg_file, 1)->nf_file,
                  F_UNLCK, NULL, (void **)&dp);

instead, to avoid the Sashiko-reported UAF finding.

-- 
Chuck Lever
