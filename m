Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429C1FBA
	for <linux-doc@vger.kernel.org>; Sun, 22 Sep 2024 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727010827; cv=none; b=NMxE1RoJvQ7refeZfKyX9dfZCsj5Gy8o7Sn3Lzf0YsZ+FyHRsy3/d140eerV413IJP7ApNTtwhg1ulFhQHJH8M5IZP4qgVNFNU+lamy72Y8Egal9iKtD7ISKJ+yeG4WVJ7j2KJ9zJk40HjlrGTNBMHhrb68LjqG4Iz9x7u6TQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727010827; c=relaxed/simple;
	bh=MiyF+tn+kcoh4mdbhtWHrOJ89UifnjpVtmP4/woYPFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRw/+RHTTLIttvo31dOY7Tld40OoU7iVdqXNbLERIrg3OiW00rfqCcTFvAkTFk0u3n2hCa/9WLcY2WHQKOpXbBlH/U1J2itM4PBMvlbGkVlL5Z4SabW46rs/A+GgWigkMx+JSbsuvfEaDzcEBrVqjfvDzEh3jEo2nFpJ3ah0h74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d3o4QEKO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d3o4QEKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727010824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o6w+52ZmAtp9Rr2ZpQpdI5p+hg7WT52Y4HB3TS11h84=;
	b=d3o4QEKO9cAYXU5XdKDdvWP6ioZHXN33lbTu8jXZQOCCJ4cESzfzRpNLvDyr8vQygb/MSM
	jp29/kAl/05QbaMp1k6jKVQ1YcC51hrZQ0AX6Z+SG/u9a3dR1XpbpSmkcPqcLVFEJU0bdd
	YxmSboJpBHZ1BfkrM46Are8MIrD8n/E=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-5sZz3x38MweqNU-bHaTFTw-1; Sun,
 22 Sep 2024 09:13:41 -0400
X-MC-Unique: 5sZz3x38MweqNU-bHaTFTw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8F6DD1934BCB;
	Sun, 22 Sep 2024 13:13:39 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.42])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id F1E2C19560AD;
	Sun, 22 Sep 2024 13:13:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sun, 22 Sep 2024 15:13:26 +0200 (CEST)
Date: Sun, 22 Sep 2024 15:13:22 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: "qiwu.chen" <qiwuchen55@gmail.com>
Cc: corbet@lwn.net, mhocko@suse.com, jani.nikula@intel.com,
	akpm@linux-foundation.org, brauner@kernel.org, paulmck@kernel.org,
	linux-doc@vger.kernel.org, "qiwu.chen" <qiwu.chen@transsion.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] panic: add option to dump task maps info in
 panic_print
Message-ID: <20240922131321.GC9426@redhat.com>
References: <20240922095504.7182-1-qiwu.chen@transsion.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922095504.7182-1-qiwu.chen@transsion.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 09/22, qiwu.chen wrote:
>
> +	for_each_vma(vmi, vma) {
> +		struct file *file = vma->vm_file;
> +		int flags = vma->vm_flags;
> +		unsigned long long pgoff = ((loff_t)vma->vm_pgoff) << PAGE_SHIFT;
> +		struct anon_vma_name *anon_name = NULL;
> +		struct mm_struct *mm = vma->vm_mm;
> +		char buf[256] = {0};
> +		const char *name = NULL;
> +
> +		if (mm)
> +			anon_name = anon_vma_name(vma);
> +
> +		if (file) {
> +			if (anon_name) {
> +				snprintf(buf, sizeof(buf), "[anon_shmem:%s]", anon_name->name);
> +				name = buf;
> +			} else {
> +				char *f_path = d_path(file_user_path(file), buf, sizeof(buf));
> +
> +				name = IS_ERR(f_path) ? "?" : f_path;
> +			}
> +			goto print;
> +		}
> +
> +		if (vma->vm_ops && vma->vm_ops->name) {
> +			name = vma->vm_ops->name(vma);
> +			if (name)
> +				goto print;
> +		}
> +
> +		name = arch_vma_name(vma);
> +		if (!name) {
> +			if (mm) {
> +				if (vma_is_initial_heap(vma))
> +					name = "[heap]";
> +				else if (vma_is_initial_stack(vma))
> +					name = "[stack]";
> +			} else
> +				name = "[vdso]";
> +
> +			if (anon_name) {
> +				snprintf(buf, sizeof(buf), "[anon:%s]", anon_name->name);
> +				name = buf;
> +			}
> +		}
> +

Wouldn't it be better to export/reuse get_vma_name() rather than duplicate
its code ?

Oleg.

