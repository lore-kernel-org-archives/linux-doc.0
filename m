Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0454829E0E5
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 01:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778723423; cv=none; b=O/lmny25HQWEKv23Fdw6O5F3hFAkYCDiurL1lw04WwIjrokyEZwmothpGb9aIYWlwlxFRVxgiAfPA5alrRttHKGU3zNvPFnGzrXpHz1e2tuyLNEWipZOxYQ0Wh/NGsSzI1vDNmpcJwbirTWLx5LHaBJ+6kSnemtNR4f4mtz05r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778723423; c=relaxed/simple;
	bh=b1SJCsRjN4qVXBbXXcSZ8S481JDIBqIMGFIaGROaXd4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FhLLLQAsnaulluIneeUcQnizRTCWbnA01Rg+dJTIyROAPOO0M85H9bVT4Ed6854PJhAILFv/R7Xetpy0R3j/oOGHMFxfiZVtQrmOOzuZuoaDNjdRYxwARYQ5JHM67Bp3GCTLXG+/bQKqRRw/0V/XIGHU7cy/lAlubchMeOqbnT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD2c1quL; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD2c1quL"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-479e6bc357eso2978298b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778723421; x=1779328221; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWw4PA4xea3qoVC7BJte8Yrd814HYwd8HlKIssZKr8U=;
        b=gD2c1quL+OKgxFsk3OYaUEMd1mTk8yg1ysxnNKRPFfdW1V1jrvzU+flM4h77jxKeVT
         NdRqSkn1GeCavfk963iW1For5nkAcciNpSzQw0EySLG5vFypDxGIBK8bMcPan3YXo7fw
         dHL9LlsV/wR6VbisjpBdkudjl1GmxdXoIJBBQmL+KWUcRV1dBhq7lOTdDS0dE0DC9cyo
         iKxhyLgmwCAP9rUE4DkMveRgqMTn7qd6RLLHpKJAbnoen2c4I80qcDaQfncp2NqMcYj+
         F6ZrUyvTMoNtchgYVyr6fuynfnXDs+KeqYGYbun1DSsFVCZx2PSNCSOLPAg/Ubr2IjPd
         uERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778723421; x=1779328221;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWw4PA4xea3qoVC7BJte8Yrd814HYwd8HlKIssZKr8U=;
        b=PtCIsTk3UjzEXfX5wUoq0GPA7ZFcnYj/ekKMhFKq+4KI2N/WGKE+qIGJQ4FjXa7Pm1
         sfLs593pyxdpk4QYLdduXrKJzkusDKlCjvtZbCQDb3pJQD5Rl8Vpgakhm38yPyanrSAe
         GJnRI/ng2vMwu1Wg5HsK+4avCxbSNm21IRAECAWs5glGNJUGHjGeRCujr5eGLaQqaC1b
         +Cbx5SsNdNAqzomOZKnrKYtaK0FgLtOB4GfZmtzYAH+my82/aYt0ZarpcO/mxOc/C2qq
         n0Ce8hK8guZpSegn7SL2zr2nX+uiDDDqnALLG5WfMbwHJDkcZk4eIlKCfGeRtYmGSxYS
         TIUw==
X-Forwarded-Encrypted: i=1; AFNElJ/a0QHvus4K7nuy+mZMqLwQcHm3WbJDyQPf6M0QmKIBAf5JBIPkJ2xr3US9zPRQaGeXyuAAFsJ/nMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjPCg6TaIT0hicEC/peQaKW1CE5LdRaAQa7F1+fEGwoSwC8eA+
	vM+pKWNe+NkaBHVXrfFLIPWEVpmFJIS2H09r3mvW5UkEX9e6TEazgpZx
X-Gm-Gg: Acq92OFhMkcB4dABEf+VmBd1csf211GPGt33ixTKkBctx/doRPA1cZcqtt5uEoAN2Lo
	0DMNJyjgUsyUV5CLrdU+vG1gIbmzfpLIR1IUU6y7XfRpTblfMfkhL/V4VGBkqIk0LzDQ4JUCjve
	IIOnurYzylziecYAKiNTjVYh17BvVSNr39DplgvuSBim/Ivf7SjjXIfavdKyLrA5Aoe9fy3eXR8
	kuTEnMu/kZ9eYKBBJSy52LznwNwa5JQ0Qut4IvNvOKCktjde+TFaMc17UIyODIDBFyrF+u+U4pb
	9Lw5u3qHEkI3Gt9V+HRIBoIhyKU+4tNFymBvc2uIIrYAbeAI1yPDz5xqn9Uo4SxWRRFptVgJ8gV
	3h41I1dzTbx8NjPMk4HzWNauTVtNpa26OoRqQa4RLvXarAodm/ULLWCdCEMKRKfhO5XZTO3UXeP
	a8mZPQAbdHso9e1DAHIC81dVCHBGSn9s5MxnCDNDc8kufoQFiKqYVN76No+6QORk/sKzujbzLhX
	LlmTCuIT8dkU7fIKA==
X-Received: by 2002:a05:6808:1492:b0:46c:cdf4:1be4 with SMTP id 5614622812f47-482b2a5c978mr3483177b6e.10.1778723420780;
        Wed, 13 May 2026 18:50:20 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:50::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482d3d4a8d1sm417604b6e.15.2026.05.13.18.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 18:50:17 -0700
Message-Id: <DII0TT9LXYCX.2GMM6QA4Q9BPZ@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <vmalik@redhat.com>,
 <linux-kselftest@vger.kernel.org>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
Subject: Re: [PATCH RESEND bpf-next v10 2/8] bpf: clear list node owner and
 unlink before drop
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, <bot+bpf-ci@kernel.org>,
 <kaitao.cheng@linux.dev>, <ast@kernel.org>, <corbet@lwn.net>,
 <martin.lau@linux.dev>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@fomichev.me>, <haoluo@google.com>,
 <jolsa@kernel.org>, <shuah@kernel.org>, <chengkaitao@kylinos.cn>,
 <skhan@linuxfoundation.org>, <memxor@gmail.com>
X-Mailer: aerc
References: <20260512055919.95716-3-kaitao.cheng@linux.dev>
 <da95f45b43d94d17796b19abc4c555e35daafab7d5e1cdca3714fe0f54ab8cce@mail.kernel.org> <e141699dab70282d811ec30bbf2aa8279706817b.camel@gmail.com>
In-Reply-To: <e141699dab70282d811ec30bbf2aa8279706817b.camel@gmail.com>

On Wed May 13, 2026 at 3:53 PM PDT, Eduard Zingerman wrote:
> On Tue, 2026-05-12 at 06:41 +0000, bot+bpf-ci@kernel.org wrote:
>
> [...]
>
>> When a BPF program holds an owning or refcount-acquired reference to
>> one of these nodes (node X), which is structurally supported because
>> __bpf_obj_drop_impl() uses refcount_dec_and_test() and only frees at
>> refcount 0, a concurrent push to a DIFFERENT bpf_list_head becomes a
>> corruption:
>>=20
>> CPU 0 (bpf_list_head_free, lock released)  CPU 1 (BPF prog, refcount X)
>> -----------------------------------------   ----------------------------
>> (owner of X =3D=3D NULL, X linked in drain)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bpf_list_push_back(other, X)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__bpf_list_add: spin_=
lock()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cmpxchg(X->owner, NUL=
L,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0POISON) -> OK
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_add_tail(&X->lis=
t_head,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0other_head)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-> overwr=
ites X->next,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0X->prev, corrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0other_head's chain
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0because X is still
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0stitched into drain
>> pos =3D drain.next;      (may be X or neighbor using X's stale next)
>> list_del_init(pos);    reads X->next/prev now pointing into other_head,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0corrupts =
other_head's list and/or drain
>
>
> Kaitao, this scenario seem plausible, could you please comment on it?

I think bot is correct.
This patch looks buggy.
It seems to me an optimization that breaks the concurrent logic.
May be just drop this patch and reorder the other one, so that bot
sees nonown suffix logic first.

