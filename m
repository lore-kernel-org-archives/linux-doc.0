Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470EA3845DA
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 22:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711582; cv=none; b=m4ntusyu06fVs3/BRClq5FlXOpeU7aBDdbIGFCX7ur2Qn23ph3ebajLUmtKIQFA/R8ww1LUusvoUc72y5PDWvNIu5k+5gbRFgTU65aOrbrSue6QTShiRvwS7Z3MFiM8Jzkw+9iPEQajFmME8L6ffU1jHad+lE5sTjRqrETsLv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711582; c=relaxed/simple;
	bh=/i4iQVVYgZcyZkahqB/Yq4izkN3VKOXSgDTz3AsYNTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fMzrqcqa6mJMGY+LPEFGQ7IJcctfMg8fSvPKzIIhUxi58viIL0b8vvm6zz6AzOqF0KCeTZLWN1B+OdDwEIV5OeWZmOFejk8tSbTQeDpxRPUUAvhJmAXNKzHwrREBmbaJB2rK7SulmQKhwDkyI50NT7XXYQQT6ePfjXAIXEF3Umo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7WQ2Zns; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7WQ2Zns"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f0ad52830cso10826926eec.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711580; x=1779316380; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uSoqkJU8a2VQZhervRKHGXNqeNUvIdC6OMh7SCfL6fk=;
        b=D7WQ2ZnsIVpUZ5yfP4dzrtkImYWkjU7xeCJZva4XgAt4pQmhJzWKHWXDDTK0F78mgl
         w3limhtQyrpjuOHpNLmj0wWhI67/0LNVn6oTlmKu3ArZ5yrnAp3112wR2wPpt//p0KxE
         bjaCRFicA8WoD0YPXQgN5dkNzf9JDYGxqd7ToxR5iVp6uFC3bFiVEK4Gor1oFYVnxLwo
         fBcR0pcyL2EdxTcR3OmILng3wJWzURBsJkah6POuuKjbiJZpdZ0ZoEI66Kyrem2MGmC1
         jW9B9uIpd3O9Wyd8d4tHH/J2Z0cM318cPhJo/j7v7teXtVHg9lNccgZq0D/3Unxf9Ihk
         l7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711580; x=1779316380;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSoqkJU8a2VQZhervRKHGXNqeNUvIdC6OMh7SCfL6fk=;
        b=WWb5r197a36iaPtQjmCmouPbqhpFy+0ArEuvUEnts+FSV6EOVTY3iwi08WCh0cahLC
         j1iNqUWzd0NTJKRKi38cvpWRIpeOFP9QRJA/ZlUhuspJY9J8I94E7IcvTQpw5rgDo9hS
         XWiVy7OOiN0g3bqhtva+Ls23MeoyO4CBmPguOxCUoclseSN9YBwiQuzEZ/UY7wQ247hy
         /W6DReQTs5HX36JXT4uD+3fiK37ptS+h/bfdbNV0a9qpFjcRn61PXPmkS0FmYMMStENP
         Bwp1PyrcP+iOYeRsHlUt9zQgAKmhNUwRf7n+4DpZbeZTRE7ym0XmLuDJ2vPPLetlc+Ej
         QCPg==
X-Forwarded-Encrypted: i=1; AFNElJ+bXvJJC1cw2t/O2kbSNUDjhpE3q6Zsofx6s2X6TFxrRCmn7cdd/qQehmDIDUL79JGMGul7a7DWNJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ck6o21lYdb+2YGPX9zMKG4110jEMZJq0GY5XmZqAQhKf4BLB
	aYJUH32/50GnPq7joEGxrj1nDG9MVp50bmApTZtG4qvRvcMHA7pASFDy
X-Gm-Gg: Acq92OHptXWsYR/OJjPPugnEZpLM2nJdrDG6HkSeBG65Ou3ZpzYfd3eu82pZKSE4eWA
	7EU9JRy1xoIcIEcJlLScuMhaafT14FY8A+qkOoT1QQqNIttLxN0Eho1D1WRkRcXloWNOqqGd+91
	xa3IDWTW1OfOE9ahiF9rZKYrUpI/+GiNPjdNGoEicStxnbWcZIH+qZy0ML2A6DbfHukA2Db4BJW
	HITRuzzF6Fq95MUJB0eRpc4b29jOCk+gyU1HMLKv8DhZlty+4/Zh+o1IVJxc/SZnLhn2AuR29I6
	OvjcpLltGeNr46rVrjxlnLb+OrHVfRl2Vy2BNw3V1M+G+5X/98Nh+ahEgQhG1Syx8CSc2eKIOIK
	AoDWwfKFLXQgtp+/5rnNIpPqCELJIwGlcDPnInovoDnThmMh8gJ9f28XIoulR5y8q7se0WryCMK
	+sBnzyXBG4JBbn7yey6cDScqrki1Ck9BZPim/P1+XBU3Pb6adlDkJ0Kwm3SVCpzUqMu7wHHx/E2
	X7i/SI=
X-Received: by 2002:a05:7301:1011:b0:2be:833c:149d with SMTP id 5a478bee46e88-30119f71457mr2928472eec.28.1778711580223;
        Wed, 13 May 2026 15:33:00 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294adddaasm761840eec.13.2026.05.13.15.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:32:59 -0700 (PDT)
Message-ID: <ca14a6fd8a1f3ce1e64c70b6d9ea2baf8df913ae.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 3/8] bpf: Introduce the bpf_list_del
 kfunc.
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
Date: Wed, 13 May 2026 15:32:57 -0700
In-Reply-To: <20260512055919.95716-4-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-4-kaitao.cheng@linux.dev>
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
> Allow users to remove any node from a linked list.
>=20
> We have added an additional parameter bpf_list_head *head to
> bpf_list_del, as the verifier requires the head parameter to
> check whether the lock is being held.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> @@ -11456,7 +11459,8 @@ static bool check_kfunc_is_graph_node_api(struct =
bpf_verifier_env *env,
> =20
>  	switch (node_field_type) {
>  	case BPF_LIST_NODE:
> -		ret =3D is_bpf_list_push_kfunc(kfunc_btf_id);
> +		ret =3D is_bpf_list_push_kfunc(kfunc_btf_id) ||
> +		      kfunc_btf_id =3D=3D special_kfunc_list[KF_bpf_list_del];

Nit: to keep everything in the same style, maybe add a is_bpf_list_del_kfun=
c() helper?

>  		break;
>  	case BPF_RB_NODE:
>  		ret =3D (is_bpf_rbtree_add_kfunc(kfunc_btf_id) ||
