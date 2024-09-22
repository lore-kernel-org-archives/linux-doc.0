Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FBA321D
	for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 12:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727009725; cv=none; b=PvPQkO0sSsYP4fjbqb/xPGQ1KPUjl/Tq6ZQu/2enzaXJlFe3hLLt/K8Os4TzWmJbiTcKDkVeOJQ7kkcFl6/SK6B6+jGSQFGpj6Qt+X3jec84wJ+zHNtyI0WBmXYAVeCPkwlsh4H8nbUZzqLws+Tr1MTI/AmcYOPaY1GrPpz6xAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727009725; c=relaxed/simple;
	bh=3tWYqI7ESR2PkD5yF7Ujend92FQEIquO3TcqsrQJ2v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqNUkxNahjH0sY3s04CwHWm5sN4u2DPphb3ER3kkoxtfJEuyuXTlExi3o31x8aENyhkcKOpmo/QxB+HwrPMU0DZzRc9H3MVFiGfsdnMNMPa9V0ERX1S0gtjFBDSDODOcKvyppTXVKW2kEYQdkqT5HIyHnvzL+EWm43cC/8xGpiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CwwUqdGr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CwwUqdGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727009723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HJu5OA2N3X4rk8YmNnrd6Eec6y1gkJFQlhfmBaY80jU=;
	b=CwwUqdGrqKEw1m1Awbpf3o+TOjQqPWSgIHLYQQW5Im2GNIDdfHPWUsEIaXdyIJoxG0BLmk
	RNs+WDN7i+5+PcUnznJvEK2sPXITK1oUvkzccL9m5PgwdAK75cdiwouBIrwllQmFWczEGd
	wz/ntq58ZIkrS+UvK7utMfsfiJPWpAk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-272-oI5VGB6EPci41-_kRMOg6w-1; Sun,
 22 Sep 2024 08:55:18 -0400
X-MC-Unique: oI5VGB6EPci41-_kRMOg6w-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E6D051979062;
	Sun, 22 Sep 2024 12:55:16 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.42])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 087ED19560A3;
	Sun, 22 Sep 2024 12:55:12 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 22 Sep 2024 14:55:04 +0200 (CEST)
Date: Sun, 22 Sep 2024 14:54:59 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: "qiwu.chen" <qiwuchen55@gmail.com>
Cc: corbet@lwn.net, mhocko@suse.com, jani.nikula@intel.com,
	akpm@linux-foundation.org, brauner@kernel.org, paulmck@kernel.org,
	linux-doc@vger.kernel.org, "qiwu.chen" <qiwu.chen@transsion.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] exit: dump current pt_regs info on global init
 exit
Message-ID: <20240922125458.GA9426@redhat.com>
References: <20240922095504.7182-1-qiwu.chen@transsion.com>
 <20240922095504.7182-2-qiwu.chen@transsion.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922095504.7182-2-qiwu.chen@transsion.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add lkml.

On 09/22, qiwu.chen wrote:
>
> @@ -847,10 +848,12 @@ void __noreturn do_exit(long code)
>  		 * If the last thread of global init has exited, panic
>  		 * immediately to get a useable coredump.
>  		 */
> -		if (unlikely(is_global_init(tsk)))
> +		if (unlikely(is_global_init(tsk))) {
> +			/* dump the pt_regs of current thread for debugging. */
> +			show_regs(task_pt_regs(tsk));
>  			panic("Attempted to kill init! exitcode=0x%08x\n",
>  				tsk->signal->group_exit_code ?: (int)code);

Well, this means that show_regs() will be called twice if CONFIG_DEBUG_BUGVERBOSE
at least on x86, see dump_stack() in panic(). See also show_regs_if_on_stack()
in show_trace_log_lvl().

Not good...

Oleg.

