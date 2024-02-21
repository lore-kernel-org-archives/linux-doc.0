Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE30126F37
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 23:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558316; cv=none; b=aUcl8guE+q8AQ6iRKLRR9k56ABhh57dYd+pJQPGAwHf2bHQb5o54ad+2AxLC8yMqBxJ5hH84gmWzpo4J0s0Ik01gPv8f1o480WS4lWMy9yq/nXU6AhA3rFIvte0bgGgA+yugjS/x+wcVSIMei43CuG1kaUTaRjprLR7G9sekbXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558316; c=relaxed/simple;
	bh=WgLwLSocZ7FS/OEk2fPe2rx5sR/6WFIAnJST+HRVhCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSRYfltP7cWJRKQ0PtQgv5NMXnfOPhTa0rxymSRjsWJ1GRyrpQuEraH1Zt/dwnvlRjea91AeQZhBnlaga6phZlvNS+BaV4qx3/reRpvqxUw5WbAUfT9SHIF1qpkZnhW7Ye/7m07/B5yQQDwopai9v2s879bHiBYnIm8n5Y7aEok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GwG5Xtha; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GwG5Xtha"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so5363283276.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 15:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1708558313; x=1709163113; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZu2GPrrRR4joejlRHI45PmLXsG4a+4mbcvu2KMsfNQ=;
        b=GwG5Xtha5H1vqGrGKMhJTy7HsndGLVt/3YtlVxa9bl/MkQxHqP7KlJmCG2AfacfGNx
         75ZCNWavwgS6x9vOLCE+TdATKrHN0FExiLxmZb0uBY2gfMtC+yCla+N9ez6TWjcTAyYJ
         M3+uRdoPqQuADsyoLrdxIibK91zUl+K40eL3mAUlkf40CFd0eTwpGTvKnk82MWfubbuP
         fFZVyBar9aJ+glrmmOb5y/g6TtnZcbrLj0Zv3c5QuTfJQqi34ovQwSOugA5MBXt2Zes2
         JR1bqiSQC8toLOiFsOJT8P4vJMvObpe00mMlyO8FgSyb5Q7MxcwBI+91Qq3x3gcTx07f
         ypxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708558313; x=1709163113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZu2GPrrRR4joejlRHI45PmLXsG4a+4mbcvu2KMsfNQ=;
        b=UBtY3pK3h6HDluPab+LfI4I50h+XANwAtG//bfwBLkQEJJe8KHfmGcMsCH5Y2iMVKh
         RclxP2N6yR3AOsH+ytWESaSkLZtvM8Pb8JUbvyjVDjC8kk+b2n1Gk5LlPSWYgGX4oVh8
         PXTO4kNvuDjQA24jUan/K+ClbTsPUUuHSk7R4T5MtS0VmL98iTyqdbOmarvyZVXmn5qq
         HiWH3UmIRNs9Ske8SknLEOO+pKNC5lYcicOkrs4qbVCjEYQE6QLZSFRI3XY984WhHKcl
         b2PnQyDIUQ7O8vTbJbvhdQdl++OE3ymFkph8lrmw2s/j49CBRwj55eBbfPq9ilwyzvG1
         4Gmg==
X-Forwarded-Encrypted: i=1; AJvYcCXjIvb4oiI9n82gtyCWZgJrbngymLGQ1L5c6z7jXoMVTC3yaKzUj8VF4Bu5yRbjPjdrj+5QhKGZTiYrLGiW/szM51l3oB6YKbOn
X-Gm-Message-State: AOJu0YwZSf3otOY2zRIyudxPhyoPCm7CDelZ/2BZZ2GVg8qkciuO814u
	dGexpGE/tzbKuleVDfNIWIXnfVxCMZZhOxxmyGPwUKszk+mvH41tTRDFhaqWsZwfGUwl9ukVwaS
	xJlzgtZ6niJurcRoGMtS9n/lqx6oHUj5uVb58
X-Google-Smtp-Source: AGHT+IH2hhk/+Fh5m9DmgNGJCqgA2pQu6OP5c4JBKagU6C5V3tlE/W9NCn7tcgM5vKu+Evy4U6qhYX/TuSKBbQJJqnw=
X-Received: by 2002:a25:8881:0:b0:dcb:e82c:f7d with SMTP id
 d1-20020a258881000000b00dcbe82c0f7dmr840538ybl.41.1708558313639; Wed, 21 Feb
 2024 15:31:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-idmap-fscap-refactor-v2-0-3039364623bd@kernel.org> <20240221-idmap-fscap-refactor-v2-11-3039364623bd@kernel.org>
In-Reply-To: <20240221-idmap-fscap-refactor-v2-11-3039364623bd@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 Feb 2024 18:31:42 -0500
Message-ID: <CAHC9VhQ5QK_4BaHCj9SEvW9M_suWa9edDXrbw2MiNcn56eoWPg@mail.gmail.com>
Subject: Re: [PATCH v2 11/25] security: add hooks for set/get/remove of fscaps
To: "Seth Forshee (DigitalOcean)" <sforshee@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Serge Hallyn <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	James Morris <jmorris@namei.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, audit@vger.kernel.org, 
	selinux@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 4:26=E2=80=AFPM Seth Forshee (DigitalOcean)
<sforshee@kernel.org> wrote:
>
> In preparation for moving fscaps out of the xattr code paths, add new
> security hooks. These hooks are largely needed because common kernel
> code will pass around struct vfs_caps pointers, which EVM will need to
> convert to raw xattr data for verification and updates of its hashes.
>
> Signed-off-by: Seth Forshee (DigitalOcean) <sforshee@kernel.org>
> ---
>  include/linux/lsm_hook_defs.h |  7 +++++
>  include/linux/security.h      | 33 +++++++++++++++++++++
>  security/security.c           | 69 +++++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 109 insertions(+)

One minor problem below, but assuming you fix that, this looks okay to me.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/security.c b/security/security.c
> index 3aaad75c9ce8..0d210da9862c 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2351,6 +2351,75 @@ int security_inode_remove_acl(struct mnt_idmap *id=
map,

...

> +/**
> + * security_inode_get_fscaps() - Check if reading fscaps is allowed
> + * @dentry: file

You are missing an entry for the @idmap parameter.

> + * Check permission before getting fscaps.
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_inode_get_fscaps(struct mnt_idmap *idmap, struct dentry *de=
ntry)
> +{
> +       if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
> +               return 0;
> +       return call_int_hook(inode_get_fscaps, 0, idmap, dentry);
> +}

--=20
paul-moore.com
