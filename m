Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF4439A815
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711630; cv=none; b=ohCXmp0u32jRxv6P9XcfpaEORp5c09aFieLQiX2J65kBdN4x/O8N+kAn3qmWgbGl7H/oDmABsf2BJF5R+rNkm0xF/8oO0jHFMKj/dqoPowjbzDcNIQOafeFHnWGl/jlu67y4Z7B2A08HzczFZsKJBvGYTkTaMIu11VQjWHYePDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711630; c=relaxed/simple;
	bh=kgA0KAea695MAc8LHoG5EseKaGFUKSpbXPmYExsdEug=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=auDLabtiX0PcGUq15kf1GpZjQvdylOz12MmCkrcb28IQ3btnyiJJYmdWaD6tGTdkiCbylPjeGPzEYIgLq8WIXsFx5CDqQK2kAr7kErRdgVblrP+w99SSjgotyNbX/gKtYokyXTMnOsKutvKQAMq2csHvDVKs3KLJX5exMcSFtOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnHmWezM; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnHmWezM"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12ddbe104ccso6801475c88.0
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711628; x=1779316428; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kgA0KAea695MAc8LHoG5EseKaGFUKSpbXPmYExsdEug=;
        b=VnHmWezMo0YlbCNcA++RfdlNu1SAfug0zNNW+AX2t6EAp7QeMQCIqBLPh9tYDkgJn/
         Ukjlom+POn5HpSnk683AJE96NFrKsWoEOtWmHsQzraB917NphnoaZ4WfEa1S6pQ/jCJY
         Xu7TMuRJ79epD8mXu+HYjS7UN97TZmYuJYHvbjxNeniFR3pf6GuSDGcuvgfqBypKmW3L
         EZlQWBd8gtqqFqvbjtD6dd8xsGCG2rMAgqmJAqxfNvdt3Z0ZRHupXQwRdBgQkVX81l0e
         Cw4KrJS3DEIv7lawH2dowOP0mBVBTS8xR+eRmiHNMMTmUWyY0cGm0t6hUwjm6iI6ur44
         LvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711628; x=1779316428;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgA0KAea695MAc8LHoG5EseKaGFUKSpbXPmYExsdEug=;
        b=X/e9R/tbXeVkLGbMrzp/QRUcrI8hV5THDwrV8TvFLUkTSt82TaAZx0N9Xr64bPTz07
         rgz10ohak5hm3akOI51xTkujWlo/fT2IPH4P9UaoWDTnJgZrObhkqqGf4GwaIa1i2srG
         uWN9hnTgIm4U8QSBm99ee0/cybjfOTRa3S0resp1m/n+NRbUdHIfbToBkZtMwvkgGKfp
         5I74JfT2R4axrzkyg7vEgr8sqxNTQ0sh3FEXVEGO+HpeA4FxjU3VnRr2ufW/Zivjo8yl
         v0nuMgNsqg5mSMFmLg8AwR+19bt2pYX92nowX7UEAeSlOEVe89iG4gHHstQCujy3z8He
         4HSw==
X-Forwarded-Encrypted: i=1; AFNElJ++CzfhhiSXs9LtrUXKT/gvPrTOnnrGwH/2N7Ap7Nj6qe8YzRAHFnES+IZl/EnRCIIFH7HmFsV5IKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjzQFQsaWaljbuaMwKYueYPvwzK4JPBU85gw9NbZo30EtXlZk
	Yw2pxj3yHbPOs2kYknUMo6b/uVj6SfMumtPvHBLyxIh15YybveOmOb0L
X-Gm-Gg: Acq92OExe2Ns6TxIAm/x8xwbnvsnTUZgNGK6WBxMzpHd72XDXhNHecaSMB4LrlYn4lq
	Qvvm98leB20PAKu/J9KwrQkMO4mxqk4M7OV3MlDzpx4LnWSeNlbIdzBhaYpHmdf2tg4JZIR70d0
	V62L6IK50OyZoH6dG1QilRp0VSGHTiF3qqW/Zq+rd62/PMlTjbl81yVp8afCN2sftY4MP08YdSc
	xitCEYblWPq8W2BN1Oa4hISSi6xWC+1rjE1qnuSI6RNFmZHd7DkLXyZ36ynS+1mU7ALncKZT6qj
	Dtg4IWaD4rv2EbtjomjqX10QLGeM5noHidUX1TWJZ8RzYINSY1T5pn2EQtBmRH6C5Yk4+9KZRMS
	GBOliXcdy9OEOl46qfKVqTL20ArQjOBCOhB+MayF2Bnm/o/rkt1YypF5x5JjHcXt+WB3CS846ks
	dTYlZnAGA2uhw0jbWqfcB2ZgzGZTuMAs6shT3b/YotE0YYUFaNrpQ7xz9Njc5/9hUQZb+UX68tq
	91eXXg=
X-Received: by 2002:a05:7300:c87:b0:2d9:6f2f:9f6f with SMTP id 5a478bee46e88-30119f5955dmr2880656eec.24.1778711627516;
        Wed, 13 May 2026 15:33:47 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30297bbc9a3sm718642eec.31.2026.05.13.15.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:33:47 -0700 (PDT)
Message-ID: <2ec40641b6d0313674557a682984d7ea9cdf24a4.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 4/8] bpf: refactor __bpf_list_add to
 take insertion point via **prev_ptr
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
Date: Wed, 13 May 2026 15:33:44 -0700
In-Reply-To: <20260512055919.95716-5-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-5-kaitao.cheng@linux.dev>
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
> Refactor __bpf_list_add to accept (node, head, struct list_head **prev_pt=
r,
> ..) instead of (node, head, bool tail, ..). Load prev from *prev_ptr afte=
r
> INIT_LIST_HEAD(h), so we never dereference an uninitialized h->prev when
> head was 0-initialized (e.g. push_back passes &h->prev).
>=20
> When prev is not the list head, validate that prev is in the list via
> its owner.
>=20
> Prepares for bpf_list_add(head, new, prev, ..) to insert after a given
> list node.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]
