Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793136818;
	b=jHnshCsYsZWIMi4C+WWzDU0Sp0UphwBW6TYUFGOb22IJgyLmyRPFGWrraQ/8NkbfeG4o
	 0AN9LKCRCEDhigDXolVQqTpnRdX4awpmE4hteaauiVooi6U5Bn5kpoTSkiSP8itQx56a+
	 XkRECyAw8/EX3aLoSrniCfzze+gnetYV1Sfkse8XA+NGtDXyDVBu8DBynj5sOBhLF4stL
	 ZLoGkKDQwgj9WMNfcGUM4amIciaDtmlZheZxDHhMPyirWMtvU+D2UwwEuT3OFBVhw6ikc
	 a7D/rjZLj7kbNHrbjRTTqxydlB2DzgZeBAztGl5vQPUJddsO9yjs+xyqQeJdSe2MSnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
	b=rlIl2L38bzEQLeDv3rC/iaNrmF+SGWj2mHE6jdWS1o68wQg4SUMPWXdOwWfh1VgUqZWu
	 EAr8buMxPatdpWQiLEIxCAjgCQD0F9wCK5RzCgP4XDof+d7ao+unFl64JdFtnXhAz/CMk
	 FyjGz33Zqi4uxjthM2yjojxXSvLI4SJNf0bp+7xubF2bq/Cf9Pyqu3T4x8NLUq+Juajt4
	 Rdp5PlK0lYwKN1K/k5Gw0GHng8guhDvmHuAZDHZXbrXYqRI5C1XiParmWSgajsVZRkoJ8
	 pbuBf4etVuSHSYsj5veUmc98vtotANAnlsC7GHFBlTK45uSP0jBxof1dvZL0FC4qyRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7sJnt3w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCEB606A31A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 21:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CCEB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7sJnt3w
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4395d31228so45392866b.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 14:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793136815; cv=none;
        d=google.com; s=arc-20260327;
        b=QZAxTRnGgN+vYgevEFNRkRIsnFG3z73q0hTK+q7rK12ETScANNjcFEKyeeOI4vva/n
         clqVAL+NwDZIwLgA9pzDNiSqY0AysYyqXdJdQuIC2L1HVeD68hLsY8HJNHIJ7GT6B/jR
         ljU+WQB7+XwRWhf/r6qCnmqnVDeQR5mD9OrOZqp7o82LpTIcbOBEdBIkcFRMSi0fQggX
         k6B51GOiZsQ7+M7f10AXZGTrSp4DXbPHsWVXFun+Y6QihRwaXoVTilUT1zF675OdtLlP
         qkgsquG2FwJpGNYSXN2s1AetcZfLM4SA6HwDLtsx7HVtr02ztFfwXPrNzW/YPL0XqEd2
         ulqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        fh=n0VbxK2Hx0mheE8hl8609AASKDI0KL0IwDWaGJXbD3Y=;
        b=gTeO0p0PHQKZCDS4SzqHC+YuDEDqJc4CovVY8HK2xPTMUtreyB8D/KOubd59KR5hTS
         FtxI4Jz7uxg2i2CebSCtIcd+rmxbqsi/WuyTjA9C0fjj5Xpg1/VYty7gGx8Fyd9NRTdf
         r+vpX3z/1Yih/McAPzz7KV1xcGZwaM31qL5iOSkxZ8XfZokK56RHDiXn/5cqr+myLebu
         L4GightIFObRXS5sfRpLNCuAmixJx+FjEw9S6M32PhQocHRkaasmxlxKqCMUj2LYSzSB
         p0YpkonmEvEHRbYSXc+QCyZ4dfyNmpuMOJv8ot9zANO/sQF019V4P44hCAJ2DDOkYMdF
         GeBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793136815; x=1793741615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=g7sJnt3wPEA2XZ1mAxKwQvnescy/AmvEeggYBV/bXD3MuIPFGWm+VsYptXHbKr61hf
         4FARY3QXaMPrBKchcQp6zZCpKuI/KiCtA21MlAlJWGy2Kd9S3keQy0aRcUWfbZq0cN6O
         t+ZUnNAzQq8AqLVI+7wo+FVX0HtqrVKwSFypfrpl5HPN5xyi3yim1BdvxmiRypr4LfqY
         icHq1yhYo+CH2xebKoxORy5HUyL1KoPxjFvTXCArpeID1YiAuC25SDJHunNWK9AmqdIU
         Y4R0H7+oxgo+7Mw4vZpkb/AlAZHlVFwc006lV1hywQyMv9pBorAhHkU4CzX47qiQSyVs
         5QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136815; x=1793741615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4jBWIH9k+0zevALV8MhMLgH9N4lxeP/UYSIcVzTvic=;
        b=Sq032JZE/7saSeSPZ+6e0jlomB5QReAQR37AxphsGFtVmig0VBrVxoVJptZVHFkvOL
         6tWrloGON8LUGQleOgOvDwD3eH2nRQMbE439I/fHkg7FWYo1nYgc4zGHXoQoEsKSm5cH
         ED/VkNgLuf5t5k41qjJTza/lYLRTK9jgTUPaQRfjaYZ733nwOU8oeBPaDOLu1gaRfqeK
         DNEZdpKSJg6Y4Op/KvRIdjr5mikwlx9X1urTKCjrmmMeH8M9tQ4iaPCVaUDfu3UHaG2h
         HLIs+qUDb0ooDoPRZ/kHruXDmTkstj8qEIgEHtsY4FyH1F+nJS9wYA15ldrA58gBHQVH
         W1QA==
X-Forwarded-Encrypted: i=1; AKwUvBzgFBH0xnm7fh4+2xDTMC6m3dzeLpbpCZE2oX4PQmFzIRB5+70Sqmz6yNfcdoe3Tk9PXOJEq7Igrgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjod8GovNB5H8snu3V9cd1D0PiQYS0I94XYqnPQvbjFxI59iFf
	PTFfsVPUw9u2JID3HaaRVlX0DxzMVQF/s8HlXRT+92qAnILVFXMeXapCVIaRMkokNGKnggCRfrO
	6QgUsqKTZjndZYuG4D1oNuiKER/DeX7f6f3nZVH3i
X-Gm-Gg: AYBFou3hqlsk7UO2Wz9SMk9oQ4wwo8xu0jJv+Dl6B/1ly96RPuwOAgt34AKn0/5oeQ9
	y7Z6kuTLSUw5c+/2gtgIrYmVZxKek3iokwN7xbcKqwSeQkTqV0dtBgASbqpb3PTI1ZTCZxhWxNU
	6WbJurqlf56dpC1fSm+Gnu1TsC7fguPrQ5Vw7++yBH6r3T0peO9wOtWxDKcAdVUTmRNDpNno1Lp
	RckPtND2rplqZzpz19Ceo74P5JkUVPr0rtqVRIW2IG2V+zX4ti6thQ8f4qq36fvn9SIGYi6Wze9
	P2yehqPLEswuvogk/0UMTMjBLXfbbNoiQMk5Fhs0Y3zDbVKs/92wogdO/o7szVZvl+N+hQ+NRhy
	K7riiuV4kfxaeSLrrfGNo6qn7kOzj3++H08kT8YJIHfxXVhb+EahQI7z/Qxz7Yb0kts0=
X-Received: by 2002:a17:907:6e8f:b0:c41:4c20:5a80 with SMTP id
 a640c23a62f3a-c49be03be8amr44212466b.44.1793136815046; Tue, 27 Oct 2026
 14:33:35 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
In-Reply-To: <94b36a91-4fe8-480e-a49a-23a81cdcdc60@infradead.org>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 14:33:23 -0700
X-Gm-Features: AclHuK_RVByZe0xeoKYD7y86VR2bYrI5dalonw-UmAvCLqjMUtZYQFJax9TZsKU
Message-ID: <CAG2KctpaX3Hgbnw4iXqrddYPJoqtVBFq2QO7tvEzhHDjgU_KAQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 4:29=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/22/26 5:16 PM, Samuel Wu wrote:
>
> ...
> > ---
> >  include/uapi/linux/fs.h |  41 +++++++++++++
> >  kernel/kallsyms.c       | 132 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 173 insertions(+)
> >
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index 34c6f219462a..b43f227dad0e 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -674,6 +674,47 @@ struct procmap_query {
> >       __u64 build_id_addr;            /* in */
> >  };
> >
> > +/* /proc/kallsyms ioctl */
> > +#define KALLSYMS_QUERY       _IOWR(PROCFS_IOCTL_MAGIC, 18, struct kall=
syms_query)
> ...
>
>
> Documentation/userspace/ioctl/ioctl-number.rst doesn't seem to know
> about PROCFS_IOCTL_MAGIC and what range of @nr values that it uses.
>
> Please update it.
>

Thanks for the catch Randy! In v3, I'll add a 'f' 10-12 entry for
PROCFS_IOCTL_MAGIC (PAGEMAP_SCAN, PROCMAP_QUERY, KALSYMS_QUERY) to
Documentation/userspace/ioctl/ioctl-number.rst.
