Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA2F38D688
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 22:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711712; cv=none; b=rshu+46GPB3SnPOVX5mEsuZe4Uz7MseJziwKwpZelUF3rYMLfCovjV+yGjEL0RV9fWUqbmG7tlLpcVMBDS4H8EjDCyVQkN/DHcqjqqrlyq6qpdVVJiDcnxWDCm6LHmvR/CGImhZcWb4oO2RIg8Tiy64CkfthJSo2KcNoXCKKHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711712; c=relaxed/simple;
	bh=c6hY0TLeDSV5AMDSqRm8hCkvr7s1rq6x1vYyUALqD6Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jk1X3/QdxiQvzkSZVvmAChKgRAogn1tc3pwY9npugnoP8P2oJkx3f7weY2jiXsy5U5s7G/wVTK7Ai3ViqDfy3+AfPprSUyUZVDXz7Br7ucgGNtfj1dy+TTiwzZSJxEa/VZBbsCYyO/MlawQip3R4d9O9VLSfkqGXjTUeLmAYEDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFRRrTIY; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFRRrTIY"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-133466cf955so1117911c88.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711709; x=1779316509; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SXNCqoVNxl+yA9TLHYQ9aS809nax/c51C0zyfUUYCFA=;
        b=CFRRrTIYd/wxZyFo3cxCmBgcTByKJb95583nIJXn28UWPRqG2woSo/oZmKZ2ubenZP
         Xidv4EW3ENNnesRSJz8CoNOUkMaO7vMM/GvbGiSqhtRo0zNVRKVlSGBPWgQQS+s/4XfV
         n9Xnir72wEAV2rcVvF5XBQ5j0eWZKdpO6lQ9pVtyf74iz2ZAmlZH30wUf3uvBZcCX2og
         Cj+bBoJS9vSeVaSqXWO8I2g9KaDAy4Q6Sr7zcO7Hqau0r+JUyXJCcOtPlrNEitZlLEAk
         khEWmN3Axu0GXTDoY6AY3/mdyLww10xiGWBIyVj6cMDM7Fc5jUZxHjdDmHi1T7jqblbl
         VUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711709; x=1779316509;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXNCqoVNxl+yA9TLHYQ9aS809nax/c51C0zyfUUYCFA=;
        b=dTvpWyOuEKHpZRZ+L+LRrMNlSwm4LzyQBswGusYkQ9BJGAClwf4fvLj7A24N3vmLUe
         c9oPTvigNSiCuiamQe9w9UQKCaCSahYewd7a//w1yhCQAiVN/mp2108eaC05qrquI+6r
         6Y27Ga6nOtxYNi8rOVjghbjThGwwF8UyUfLxm7+bljdTzszSXiRLkcEpxIwNl4yvlXeJ
         9br4t8KuXa0s8OwI61qdGFXPMNK+7PqgMSeT2fU4TdZEALQ7H2Yz3P0p9NfCUp9owDjc
         n35P9yalZ9xITXjS4R0eb68nYQtp8nKdxFG4KxQRPyHUhrkWgg9Ger+IbpIl8iZ7bNRB
         50Tw==
X-Forwarded-Encrypted: i=1; AFNElJ+3kOvyhIqTCui9B6nif9ZwPzE0g0UxP3Kdt7S7zoMcPI5Ny6Ozq4rvD7bx+vMtc0gaydKLganlkQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyxtDSO7qy3oFwny8a/xJGDEsOr4LC7LF7OjrgVp2cewXjouPV
	YYxGNzsN7bmPvu7EuCfYZFRU4cCPR2efKGpROjj+97u4CubzaavW1ELLDfoiwPmY
X-Gm-Gg: Acq92OH0JDffe+h1Z9sy394xbBMgXnIT4gh4ednA3fCk2Ivmr+itNwgKXIr18L1EWyP
	irkbhl85wJ357jraoaeau7XDIm0YYLjP7pGGQCl0TUqHjpuoUjMn0VMFD5iBZxmI1rxaLgfHkTW
	hQQ+O1n4VlZqxeNK/+OR5WeeBMcQVgOrohphJJURo1MTmtjerKED4gms2KhOya5PTP8OQ0Xvztg
	ByyyYdPjNMyO/tywcEaWOt0z5M/ENSbgbgME95dU2gd6/Ev3GPSIAToNxS8+CH1ONYcaqfej7nS
	tHdaXLqfPws7HV61WJRkKAzfvUN3hLgn4wJ5Yx4Q11Q5NxkBnIQvZqgCG/PwWsexBLxSNOERbWz
	+YNloHTDFNbb06IIGTMfPAIUCeMuRydr9JwSocSHyrSDYVWmNYU6ie9Ck76zsRFG3f6tz7b9rA1
	f5uDZSaI/zgxSU1mIkRYn2tuhczsTqz7Yn15fuT0NdhKMiYn3yzE+ykIeUWZJfIyLSZ4oR0Rl/9
	2l6Fe8=
X-Received: by 2002:a05:7022:f8d:b0:128:bae0:e03c with SMTP id a92af1059eb24-13436a9e59bmr3032396c88.30.1778711709309;
        Wed, 13 May 2026 15:35:09 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294adddaasm768297eec.13.2026.05.13.15.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:35:08 -0700 (PDT)
Message-ID: <237f26933259d2a9114b4abd9cd7773b788c2038.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 5/8] bpf: Add bpf_list_add to insert
 node after a given list node
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kaitao cheng <kaitao.cheng@linux.dev>, ast@kernel.org, corbet@lwn.net, 
	martin.lau@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 song@kernel.org, 	yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, 	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, 	chengkaitao@kylinos.cn, skhan@linuxfoundation.org,
 memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org
Date: Wed, 13 May 2026 15:35:06 -0700
In-Reply-To: <20260512055919.95716-6-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-6-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-05-12 at 13:59 +0800, Kaitao cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> Add a new kfunc bpf_list_add(head, new, prev, meta, off) that
> inserts 'new' after 'prev' in the BPF linked list. Both must be in
> the same list; 'prev' must already be in the list. The new node must
> be an owning reference (e.g. from bpf_obj_new); the kfunc consumes
> that reference and the node becomes non-owning once inserted.
>=20
> We have added an additional parameter bpf_list_head *head to
> bpf_list_add, as the verifier requires the head parameter to
> check whether the lock is being held.
>=20
> Returns 0 on success, -EINVAL if 'prev' is not in a list or 'new'
> is already in a list (or duplicate insertion). On failure, the
> kernel drops the passed-in node.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> @@ -19228,8 +19231,11 @@ int bpf_fixup_kfunc_call(struct bpf_verifier_env=
 *env, struct bpf_insn *insn,
>  		int struct_meta_reg =3D BPF_REG_3;
>  		int node_offset_reg =3D BPF_REG_4;
> =20
> -		/* rbtree_add has extra 'less' arg, so args-to-fixup are in diff regs =
*/
> -		if (is_bpf_rbtree_add_kfunc(desc->func_id)) {
> +		/* list_add/rbtree_add have an extra arg (prev/less),
> +		 * so args-to-fixup are in diff regs.
> +		 */
> +		if (desc->func_id =3D=3D special_kfunc_list[KF_bpf_list_add] ||

Nit: same nit here, maybe add is_bpf_list_add_kfunc().

> +		    is_bpf_rbtree_add_kfunc(desc->func_id)) {
>  			struct_meta_reg =3D BPF_REG_4;
>  			node_offset_reg =3D BPF_REG_5;
>  		}
