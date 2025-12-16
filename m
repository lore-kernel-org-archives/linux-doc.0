Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F192E1730
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765919333; cv=none; b=OzjY9vczM7u0+oNsaE0xtkaRSov9Ex4XTtFI2UchBaldpXflqFCWBQfAHUU+k+CwgCwLPD5vMpAe2l7OY8txQyDY7qjiaz3GPr/ErBSiQTzQ0Lw7nizC5o7fkO4wa1Enbh5+0ALsLyY6SikkSHNXkDJbIZn4zmt2ZdlLnoiJfKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765919333; c=relaxed/simple;
	bh=VH1xl5++9O6ZB5umO6kcdRVDWOTwcHp5qpV2emSsFxk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=GsieGdnJI5wpS4RZhtwRq350YUISnATzZPrnB9poB5B0LHpm5OOA2gNh8Smh56DshF0w8+yWe8pv4uwGV/D72iE4m91WRGDwo+yq2/EnL0nP6+GuzFgNQdqjoukkblOuttHJNTHznL2lJR5h4hf+9zxjvjHBPo1C3CdxekIVOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=aEPy0yza; arc=none smtp.client-ip=209.85.217.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="aEPy0yza"
Received: by mail-vs1-f65.google.com with SMTP id ada2fe7eead31-5dfae681ff8so3379526137.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 13:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1765919329; x=1766524129; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWGNFMYxe9TyC/7sdiL3Nby8ShHIEtMiyaZ/uOUZvdQ=;
        b=aEPy0yzao8r2yCpud20YJaIJXiva9haUAOV10YAdyQeJ9CBdy4RS3jEQg7oVJhuyS7
         n6IFX+D3+0Bm0kye0Il8OaAHjMznMASYv1SaX10SU2dUM2EzM7K13l5bgPE3ln87vQCw
         YsAUg8fdH0q3ELnmGEFH8XN3ETPZ4/Ich62aMkF06Wax1dY/l37ZRrAbVH/vb4rMj9cz
         mGwzxeX6PwRC0kIxq3asCnZHo3huMdZwMc28F6/8pg7yX3dgkR9WKNPbAsQTLMQGHthy
         rfDX4CYG7Xk8/bWEjwvN3kZymsyY1ufqeGJbumsE3bBVbsOIm+OUEgpTcuX5CSWTUjag
         ynog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765919329; x=1766524129;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWGNFMYxe9TyC/7sdiL3Nby8ShHIEtMiyaZ/uOUZvdQ=;
        b=mS/VWzGUz8xltByAH1wcGQAEn3G7ia7mOX7x1eTsKgVkA3qKvVug00OlOU7X1NXfWo
         jTJIEcaUj91t6YazGzIFwouJV40oXCYEPgmTtF6HPxr4lfgALqwpDfTLZPNg+iQAF0Dh
         x2K0NEOg7AcquXFLDCBXB46DwnF79I2Rv4TokKZTbyEXhcUMaPfrSg6oiYE+rKcxzuLF
         BkAe0vc2ngDU4zi9Z/Z7qJxpI60g5ZqmRIf+J1cLC9f13zIV6IU4MM4BGSv5V0CRZfLQ
         UdU/uGT9SF8EFb4kcDpJPrN5grzfI5LSQfDZXWPyR8iUU8pDAdTvyO/zo845XlZ9wPOJ
         kL1A==
X-Forwarded-Encrypted: i=1; AJvYcCUTpkg7tCO/WTu38iJeorW234vsC5GiiPBQoPU8ngrraXHUIG025n1zW12AtZH8T8j0D+KmVaCPI68=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKaEHmsqXeR7LBpzXpOIMh70O9gMG2VJ6lunIH2d65TW21fU+U
	ZNDpCAd8bbHezw89UMk+uheJG7jexvDVKZd2icl1PJ9esPKmSuCP9Ypqs3aBUfuFrx9EwtT+4CR
	UaV4=
X-Gm-Gg: AY/fxX5oV5LrH9m+beMc8T2ivYbrq0nXpYf/dNnWsgBqgm67NBqNracLvtjSqdmE9NO
	GLcCWJWmyJqUSmVqfURrluH5rJh7G5o3NnKmcEWwwrzw4gmjn9aXdq/ja22DE8BhnADxJzK6+UI
	aRzpJMRbbsnNGPnqp3c58RcylmaRBeH+0MqyKslWeh2JO43xx8mxBtkFdu+LGMD19MYKnopYp2l
	axWg+P+AwX17IEAL7oPZzoPOJdzUANbmqOY8Ywgf8pMuh1vy1yeqbEMTfvGDxYVBD+0gARTgnOv
	xmtusVSZgGZJm8JrBpIh+RAcoBZmnuoSNYhyhi+Rx23GtEFnQcQmUtAy4jEX3lOOcRlS1Xpir3/
	Mb1YTfYLXnaiwexiqToXQz3oVFZ4PMQAGFVo6HzXobh/F6mMOlrrE1SyRujpk1mQECdtDPd7IdW
	M0pHIY86VnViUpsMf+Sdrxe8GIb7/IVEmURzQeK1/4FBqrsty2WUft+dx1
X-Google-Smtp-Source: AGHT+IFVHSA7PuH01Up3KfTlcb3j+0mW1Rx9zFMCTOKbQwolakScOWOD34veXElG5sffzdLQ5yZVzw==
X-Received: by 2002:a05:620a:17a6:b0:892:ce2b:f84d with SMTP id af79cd13be357-8bb39fb1fb6mr2209857185a.33.1765918829690;
        Tue, 16 Dec 2025 13:00:29 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be31b66942sm259527085a.42.2025.12.16.13.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:00:28 -0800 (PST)
Date: Tue, 16 Dec 2025 16:00:27 -0500
Message-ID: <7ab3093710dc84dcd5b3fdeca106e469@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20251216_1504/pstg-lib:20251216_1504/pstg-pwork:20251216_1504
From: Paul Moore <paul@paul-moore.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Andrew Morton <akpm@linux-foundation.org>, James.Bottomley@HansenPartnership.com, dhowells@redhat.com, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH RFC 8/11] security: Hornet LSM
References: <20251211021257.1208712-9-bboscaccy@linux.microsoft.com>
In-Reply-To: <20251211021257.1208712-9-bboscaccy@linux.microsoft.com>

On Dec 10, 2025 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> This adds the Hornet Linux Security Module which provides enhanced
> signature verification and data validation for eBPF programs. This
> allows users to continue to maintain an invariant that all code
> running inside of the kernel has actually been signed and verified, by
> the kernel.
> 
> This effort builds upon the currently excepted upstream solution. It

s/excepted/accepted/ ;)

> further hardens it by providing deterministic, in-kernel checking of
> map hashes to solidify auditing along with preventing TOCTOU attacks
> against lskel map hashes.
> 
> Target map hashes are passed in via PKCS#7 signed attributes. Hornet
> determines the extent which the eBFP program is signed and defers to
> other LSMs for policy decisions.
> 
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> ---
>  Documentation/admin-guide/LSM/Hornet.rst |  38 +++++
>  Documentation/admin-guide/LSM/index.rst  |   1 +
>  MAINTAINERS                              |   9 +
>  include/linux/oid_registry.h             |   3 +
>  include/uapi/linux/lsm.h                 |   1 +
>  security/Kconfig                         |   3 +-
>  security/Makefile                        |   1 +
>  security/hornet/Kconfig                  |  11 ++
>  security/hornet/Makefile                 |   7 +
>  security/hornet/hornet.asn1              |  13 ++
>  security/hornet/hornet_lsm.c             | 201 +++++++++++++++++++++++
>  11 files changed, 287 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/LSM/Hornet.rst
>  create mode 100644 security/hornet/Kconfig
>  create mode 100644 security/hornet/Makefile
>  create mode 100644 security/hornet/hornet.asn1
>  create mode 100644 security/hornet/hornet_lsm.c

...

> diff --git a/Documentation/admin-guide/LSM/index.rst b/Documentation/admin-guide/LSM/index.rst
> index b44ef68f6e4da..57f6e9fbe5fd1 100644
> --- a/Documentation/admin-guide/LSM/index.rst
> +++ b/Documentation/admin-guide/LSM/index.rst
> @@ -49,3 +49,4 @@ subdirectories.
>     SafeSetID
>     ipe
>     landlock
> +   Hornet
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3da2c26a796b8..64c9aaff6a219 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11399,6 +11399,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
>  F:	drivers/iio/pressure/mprls0025pa*
>  
> +HORNET SECURITY MODULE
> +M:	Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> +L:	linux-security-module@vger.kernel.org
> +S:	Supported
> +T:	git https://github.com/blaiseboscaccy/hornet.git
> +F:	Documentation/admin-guide/LSM/Hornet.rst
> +F:	scripts/hornet/
> +F:	security/hornet/

I know we talked about this last time Hornet was proposed, but as a
reminder, here are the guidelines for new LSMs:

https://github.com/LinuxSecurityModule/kernel/blob/main/README.md

> diff --git a/security/hornet/Kconfig b/security/hornet/Kconfig
> new file mode 100644
> index 0000000000000..19406aa237ac6
> --- /dev/null
> +++ b/security/hornet/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config SECURITY_HORNET
> +	bool "Hornet support"
> +	depends on SECURITY
> +	default n
> +	help
> +	  This selects Hornet.
> +	  Further information can be found in
> +	  Documentation/admin-guide/LSM/Hornet.rst.
> +
> +	  If you are unsure how to answer this question, answer N.

Pointing people at the docs is good, but there really should be a couple
lines about Hornet here.  At the very least explain that it does BPF
signature verification and allows for other LSMs to enforce policy on
this integrity verification checks.

> diff --git a/security/hornet/hornet_lsm.c b/security/hornet/hornet_lsm.c
> new file mode 100644
> index 0000000000000..a8499ee108ad3
> --- /dev/null
> +++ b/security/hornet/hornet_lsm.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Hornet Linux Security Module
> + *
> + * Author: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> + *
> + * Copyright (C) 2025 Microsoft Corporation
> + */
> +
> +#include <linux/lsm_hooks.h>
> +#include <uapi/linux/lsm.h>
> +#include <linux/bpf.h>
> +#include <linux/verification.h>
> +#include <crypto/public_key.h>
> +#include <linux/module_signature.h>
> +#include <crypto/pkcs7.h>
> +#include <linux/sort.h>
> +#include <linux/asn1_decoder.h>
> +#include <linux/oid_registry.h>
> +#include "hornet.asn1.h"
> +
> +#define MAX_USED_MAPS 64
> +
> +struct hornet_maps {
> +	bpfptr_t fd_array;
> +};
> +
> +struct hornet_parse_context {
> +	size_t indexes[MAX_USED_MAPS];
> +	bool skips[MAX_USED_MAPS];
> +	unsigned char hashes[SHA256_DIGEST_SIZE * MAX_USED_MAPS];
> +	int hash_count;
> +};
> +
> +static int hornet_verify_hashes(struct hornet_maps *maps,
> +				struct hornet_parse_context *ctx)
> +{
> +	int map_fd;
> +	u32 i;
> +	struct bpf_map *map;
> +	int err = 0;
> +	unsigned char hash[SHA256_DIGEST_SIZE];

I'd suggest a comment block here explaining that the hash choice is
fixed to SHA256 to remain compatible with the existing BPF signature
mechanism.

> +	for (i = 0; i < ctx->hash_count; i++) {
> +		if (ctx->skips[i])
> +			continue;
> +
> +		err = copy_from_bpfptr_offset(&map_fd, maps->fd_array,
> +					      ctx->indexes[i] * sizeof(map_fd),
> +					      sizeof(map_fd));
> +		if (err < 0)
> +			return LSM_INT_VERDICT_BADSIG;
> +
> +		CLASS(fd, f)(map_fd);
> +		if (fd_empty(f))
> +			return LSM_INT_VERDICT_BADSIG;
> +		if (unlikely(fd_file(f)->f_op != &bpf_map_fops))
> +			return LSM_INT_VERDICT_BADSIG;
> +
> +		if (!map->frozen)
> +			return LSM_INT_VERDICT_BADSIG;
> +
> +		map = fd_file(f)->private_data;
> +		map->ops->map_get_hash(map, SHA256_DIGEST_SIZE, hash);
> +
> +		err = (memcmp(hash, &ctx->hashes[ctx->indexes[i] * SHA256_DIGEST_SIZE],
> +			      SHA256_DIGEST_SIZE));
> +		if (!err)
> +			return LSM_INT_VERDICT_BADSIG;
> +	}
> +	return LSM_INT_VERDICT_OK;
> +}
> +
> +int hornet_next_map(void *context, size_t hdrlen,
> +		     unsigned char tag,
> +		     const void *value, size_t vlen)
> +{
> +	struct hornet_parse_context *ctx = (struct hornet_parse_context *)value;
> +
> +	ctx->hash_count++;
> +	return 0;
> +}
> +
> +
> +int hornet_map_index(void *context, size_t hdrlen,
> +		     unsigned char tag,
> +		     const void *value, size_t vlen)
> +{
> +	struct hornet_parse_context *ctx = (struct hornet_parse_context *)value;
> +
> +	ctx->hashes[ctx->hash_count] = *(int *)value;
> +	return 0;
> +}
> +
> +int hornet_map_hash(void *context, size_t hdrlen,
> +		    unsigned char tag,
> +		    const void *value, size_t vlen)
> +
> +{
> +	struct hornet_parse_context *ctx = (struct hornet_parse_context *)value;
> +
> +	if (vlen != SHA256_DIGEST_SIZE && vlen != 0)
> +		return -EINVAL;

It seems like one could incorporate the sanity checking into the
if-statement below.

> +	if (vlen != 0) {
> +		ctx->skips[ctx->hash_count] = false;
> +		memcpy(&ctx->hashes[ctx->hash_count * SHA256_DIGEST_SIZE], value, vlen);
> +	} else
> +		ctx->skips[ctx->hash_count] = true;
> +
> +	return 0;
> +}
> +
> +static int hornet_check_program(struct bpf_prog *prog, union bpf_attr *attr,
> +				struct bpf_token *token, bool is_kernel)
> +{
> +	struct hornet_maps maps = {0};
> +	bpfptr_t usig = make_bpfptr(attr->signature, is_kernel);
> +	struct pkcs7_message *msg;
> +	struct hornet_parse_context *ctx;
> +	void *sig;
> +	int err;
> +	const void *authattrs;
> +	size_t authattrs_len;
> +
> +	if (!attr->signature)
> +		return LSM_INT_VERDICT_UNSIGNED;

Do we need to check the "is_kernel" flag so we don't signal UNSIGNED
to an enforcing LSM on the second half of a lskel program load where
the original BPF program is being loaded?

I'm also not a big fan of mixing int error codes and enums in the return
value, I'd rather see those split out into separate vars.  Perhaps
still return the error codes, like the -ENOMEM below, but pass the
verdict info back as a pointer in the arg list?  This applies
elsewhere in this file/patch too.

> +	ctx = kzalloc(sizeof(struct hornet_parse_context), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	maps.fd_array = make_bpfptr(attr->fd_array, is_kernel);
> +	sig = kzalloc(attr->signature_size, GFP_KERNEL);
> +	if (!sig) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
> +	err = copy_from_bpfptr(sig, usig, attr->signature_size);
> +	if (err != 0)
> +		goto out;
> +
> +	msg = pkcs7_parse_message(sig, attr->signature_size);
> +	if (IS_ERR(msg)) {
> +		err = LSM_INT_VERDICT_BADSIG;
> +		goto out;
> +	}
> +
> +	if (validate_pkcs7_trust(msg, VERIFY_USE_SECONDARY_KEYRING)) {
> +		err = LSM_INT_VERDICT_PARTIALSIG;
> +		goto out;
> +	}

Personally, I'd be much happier only allowing the secondary keyring on
my systems, but we know that some people are not as concerned about
allowing user and session keys, so we should think about ways to allow
Hornet to support multiple keyrings so long as the keyring is factored
into Hornet's integrity verdict.

This is worth some discussion, but we could potentially encode this into
the integrity verdict (e.g. VERDICT_GOODSIG_TRUSTEDKEY, _GOODSIG_USRKEY,
__GOODSIG_GRPKEY, __GOODSIG_SESKEY, etc.).  We could also leave that up
to the enforcement LSMs that care as they are passed the bpf_attr in
security_bpf_prog_load_post_integrity() already.  Or something else?

I'm also not sure how much key type granularity we want.  We definitely
want trusted key vs others, but do we care about user vs session keys?
Perhaps that is an argument for deferring to the enforcing LSM.

If all else fails, we could add some Hornet specific configuration knobs
for this, but considering the simplicity of Hornet, I think it would be
nice if we can keep the zero-config nature of Hornet.

> +	if (pkcs7_get_authattr(msg, OID_hornet_data,
> +			       &authattrs, &authattrs_len) == -ENODATA) {
> +		err = LSM_INT_VERDICT_PARTIALSIG;
> +		goto out;
> +	}
> +
> +	err = asn1_ber_decoder(&hornet_decoder, ctx, authattrs, authattrs_len);
> +	if (err < 0 || authattrs == NULL) {
> +		err = LSM_INT_VERDICT_PARTIALSIG;
> +		goto out;
> +	}
> +	err = hornet_verify_hashes(&maps, ctx);
> +out:

Style nitpick - a line of vertical space between the
hornet_verify_hashes() call and the jump label would be a nit nicer
visually.

While I'm talking about style, I know the old days of a strict 80-char
line length are no more, but I still prefer the 80-char limit for code
I'm maintaining.  As you would be maintinaing Hornet that decisions is
up to you, but 80-char lines are nice ;)

> +	kfree(ctx);
> +	return err;
> +}

Some of this would be mitigated by the fact that Hornet verifies the
lskel loader and all the maps, but should we worry about nested loaders?

> +static const struct lsm_id hornet_lsmid = {
> +	.name = "hornet",
> +	.id = LSM_ID_HORNET,
> +};
> +
> +static int hornet_bpf_prog_load_integrity(struct bpf_prog *prog, union bpf_attr *attr,
> +					  struct bpf_token *token, bool is_kernel)
> +{
> +	int result = hornet_check_program(prog, attr, token, is_kernel);
> +
> +	if (result < 0)
> +		return result;
> +
> +	return security_bpf_prog_load_post_integrity(prog, attr, token, is_kernel,
> +						     &hornet_lsmid, result);
> +}
> +
> +static struct security_hook_list hornet_hooks[] __ro_after_init = {
> +	LSM_HOOK_INIT(bpf_prog_load_integrity, hornet_bpf_prog_load_integrity),
> +};
> +
> +static int __init hornet_init(void)
> +{
> +	pr_info("Hornet: eBPF signature verification enabled\n");
> +	security_add_hooks(hornet_hooks, ARRAY_SIZE(hornet_hooks), &hornet_lsmid);
> +	return 0;
> +}
> +
> +DEFINE_LSM(hornet) = {
> +	.name = "hornet",
> +	.init = hornet_init,
> +};
> -- 
> 2.52.0

--
paul-moore.com
