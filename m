Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201687;
	b=pkPZm5O3tLGlIFM0/ttltYZkk8E2JitvjpVelV9nE+78m21B8DxeYHHW8CoqvZmr9P8T
	 9picnbrxifaF2OLUicYvyJg9iCVW2hhu27YQX2KkQFEYaWJ+IeRhon3GhBkIZaEnEa5R8
	 IMDnlRYz8CsBvPFAfXNXkUVJJ9aKaYioejiZ4c/tkj1Z6fXaAbwdXRXRAASLvACPtLJz5
	 BToCov5rHd2py/eL4yzz0GVjwJepRS46LfElWy3wnZs3tSpQyvQiG+uPK5hFcM6z9f/40
	 QMThqBlAAK/oEqduDVTTQcM7VANYHhXqBjIIKN3fl6XrNQmIo4zXLETw8UKQHxXW2dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
	b=kizlwiPtyfAk+xCU7CaHlhD5+Aez42L/avqOvACcuRouTy4+Sr86e3XaAolV5MAXlMv8
	 Oou0rkwLkEkMsQAI0ktOJ2Zd8cN2m67MSxu96+mo2ZO8SX8gzmX66SYllyIs9RAnZOMoS
	 jgJkjoI/q6tL8Rj/m8RIPR4+Y2NHXbsoj6BVqOFlqoY/eM0cWtmCScAzmtVtDXUrMdFv7
	 YNG5ICecFoy0xsP4kquB6LLLqE/GlaLxiukMyjvmtkDiD5834sxjRbx3gcXyBBvI50r/6
	 FyRffe0k6ZEnYIwdeq7PBxFYLvTHp62v9fmHLCnWq/UNAN1WCHrs+E9eUudhBs4ZADg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ef7UxKVo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495A606A321
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 15:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4495A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ef7UxKVo
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843ea301d60so792029a34.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 08:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201686; cv=none;
        d=google.com; s=arc-20260327;
        b=JT92MOJ8fJXmD9A4F1fh3jI4OgP2dt2UdmvwsDxSOZNmK7+sKFbf5UqMnHTgXBw/Ij
         zC5406ToXdfOnCZqkMOC08xP9AnIQek2VhzFRDeXOpajfMczCUBKtcIjEH5zjLS7+5hT
         fA2Ae4/fii4ZSuV89e6XKs8Dv3vF4Ia6T608IeggS+X8zLpbf+clYKgfkMgxPqCXW+v9
         PxAgA0lO19BtrVPqiqmypZfPEoj+cr4/gijVOBCYqcdxC0xntgcx+8Kp6aOhqQ2nSoDj
         GcGAuQWJLN287FP90+49xiPF3MKiUH7kd8BIXLUokdF69NJVBvbk5YV2+lgDj5gxDVcW
         cfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        fh=PGsTgUb1T8tJKw8E1UqtX1QjVRH1os0qdBFqjgvMhMU=;
        b=m9oGvIPkJJHV30CprcEo7wQo/4UQphQvYb5Rsb/HWOgf1HmsTGgyiMLaAXWS45SeaD
         mrnxXjvqD+i9azt1lk9mIAJ0mxz2HbzaexxUgiYaKcl0eHYEDzZT6sgcop0FpoSJeU4k
         Z7TSAbAoY+aF5jpRJyGcOPM/1c2CRVpc3Bu1bM/LF3rTXrb6g2MUG7n6zH9WQST/sXt+
         V03wNz5LN0iDQxNYabxzTpYYPKR0+tTufdd6drOu2/InWtchDOa1op1VW6Yd381DdBZz
         ouvoOkL2d8OilWqILxO33P0MAkz/DFtcx/weuJDep4flYjgkxQScSMLSPOD5OBp/1/Ux
         OQkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793201686; x=1793806486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        b=Ef7UxKVoG+4kGFp5uykkaUkiMgN1G+lhfRLa/HcMnDuSiZ5htbI+UAqy9Z2N2Vu5x2
         AH+7Nu3jLP/OrYD/VNcTT6FgiRmooO5freMk6bEYmgd57MDL+PIpGjMbnDuc0PsaShxU
         5/3RUNC4r0BI+PdMJjPh9SHdp3hIH597VpChTatGqzIJSzF5YmFX4jXsJFMoU91acv3O
         Ue52hoB1ApBbbh+Buda7XrIKg8nxxtjLMGB26NWAc+iJw/l+fGBuodmpm0fGIbJAA621
         BxIqhM70bRBAAqgrfBdZuKZ1qmZlS/oXwRLDwosHR8d6uPolfMNbRlKOIi4wUlj1PVRO
         cGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201686; x=1793806486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JNFgtKDp87voFFR8yXktG0LWODrSokHg8hARj7IkQYg=;
        b=TiS5n9xUDw3E9wPCf7JPzk3cBlfSkf5l1y2igz6udfD8nnJ8hvrvCpCViyoXgv5S7F
         c52Bk1tg/DQGLKbmxjbZbee29P3qlZAbSolfMf1NzL2m/MkwPZqgyM8FsxPG5fplPKQq
         oyxo9zWa/S9CZ09cUEqgxQ7YU8uwRgxnOCgxxN8M1nWRJzmV5OHcEGooSIkog4PamkNd
         nShKzjWNKQCHZ82jUw3IekTzRFx52emNQzA+N6cXOWMXeZwCVaoQxjva1eksSRio8fjP
         JJV07GYbKl+/tJ6YprL+l7F9IXBbMrJkiNW8l3FWXbKyBPXQUlAqookg4WVRSyAK/xI7
         KPXA==
X-Forwarded-Encrypted: i=1; AKwUvBxAzFYgmRTkaq0CRzufsSaALpClI/HOPPWVDXaTJJ2x/PRUKueQTQYfZVVZZhf6GLmB9PDSCJhXH7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG0ZMFkKMh/GHYTE6aQV6kIlDEWXMjEaLU+Qz4CtcL7r7ltfqZ
	BRZN6WcSnzUs592XAhj1mo5KRO0fM+ftxKka/EpfUMGbq2wbYwC99zYE80l9xZj3ix2RylFS3cQ
	B7VVVfxiJ4+GjCNqbspgB7kdoYaO/zC4=
X-Gm-Gg: AYBFou0P76/DP7ZIQKAlzvH0IbP1eWL51lXRaJZvXsZXtBLZP5jwh79dOFkare366Gg
	QBjKbnQ9K9jnal+OBDyFShkvcWuyzTKxj/JIdxN9IBu0sJfoGNJARmy6J9w2xruy5EQm7MKie6S
	2Mr+HkC9nkAimsSz2bgF9QwYcTGlU73qX/qfaUEm01gPyXX0iiMOsdS5uKrAVjpHUNdjLyxLC3T
	9JOWynOy6ai0DA19TB2Hw2XSRjlNcptQsqi8rqCHkOi4tFRSC0CaxoXMTHFEPo5tIriyIo6QBSn
	pw8kq9faD2Ss3I9ucQljwYmsXz/XFgPD1fLrVTdCabe1PKM71hjeFNhp+p56/9vHiemTMq0m6em
	Uzz3jVVd6pMKXOQ/rqYdF0bsqWRFd4vuiMSA=
X-Received: by 2002:a05:6830:2304:b0:846:e5a3:c8bb with SMTP id
 46e09a7af769-85ac012e9bamr2225801a34.15.1793201686073; Wed, 28 Oct 2026
 08:34:46 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793094611.git.chris@chrisdown.name>
In-Reply-To: <cover.1793094611.git.chris@chrisdown.name>
From: Andrei Vagin <avagin@gmail.com>
Date: Wed, 28 Oct 2026 08:34:34 -0700
X-Gm-Features: AclHuK81v527zBLgjPgT7UgeAn0ZRsnw4w8kJ2Fr9s5y5HrZvwNULUli5C61ZOA
Message-ID: <CANaxB-zEaaDaaR2Fszx0D4TAcKAapOfcxQ2MzZbFVAhR2n3SOA@mail.gmail.com>
Subject: Re: [PATCH 0/3] mseal sysmap: Choose system mapping sealing at boot
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jeff Xu <jeffxu@chromium.org>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:42=E2=80=AFAM Chris Down <chris@chrisdown.name> w=
rote:
>
> System mapping sealing is currently a build time choice. Hosts which
> want it and hosts which need to move or unmap these mappings therefore
> need separate kernels, which is not ideal. Let's allow the administrator
> to choose at boot time.
>
> Chris Down (3):
>   mseal sysmap: Add mseal_system_mappings=3D boot parameter
>   mseal sysmap: Allow with CHECKPOINT_RESTORE, default off

This isn't just about CRIU. For example, gVisor does not depend on
CHECKPOINT_RESTORE, but it still needs to unmap the vDSO. Other
sandboxing solutions likely need to manipulate vDSO mappings as well. I
think this toggle should be off by default, regardless of
CHECKPOINT_RESTORE.

Thanks,
Andrei
