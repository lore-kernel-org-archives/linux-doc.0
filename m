Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD421FB2
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 00:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708560551; cv=none; b=i7jamwnCbmVp7XrDGJA+a9vXurmXQ+SGqZvHutZH3+MTVIr7XLq2WLl+rx5zwn+muUERGL3mUHQauUFWYuVw80GxUjcdLjhCcBAqsDXtTXpWRSREUUvE9rNJ5QCkXaUJWg++zYTRwwvy/a8o91+z11RVT9yEtNw96xjvC60tME0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708560551; c=relaxed/simple;
	bh=aiZ2wjkXdUeF2DZJw2oBIl8u+9EyfQfZ9ycNkF8fAgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLD3XmI6yAk9IMaFtZBVW8UEPxKLSttGqUGS1WCDNG6bLyIhTo4zvUY11okzGj9SXViATaGlLjHRWErDdDS1ZGuup31RC/fRmPXrrYdQYgRLVvhmpTL0sbOEQi5JdAHJC61ZZhtYt9Qpzvvl94nSQGxv1/jW8MxVRcAUF9pxo0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=V4v3q5zW; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="V4v3q5zW"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7d5c890c67fso3573418241.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 16:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708560547; x=1709165347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiZ2wjkXdUeF2DZJw2oBIl8u+9EyfQfZ9ycNkF8fAgk=;
        b=V4v3q5zWy6TRguaajZ4nQ7fJK1qziegRcyc2f4uuaXkZgb4nKEsRZW5usZn2/WC6UG
         2HWxXkyggg+HnHBE4LSYDAV3qlSVSEAJ7vgj3MpYcNlVANNi82gJyKs3TGO95H7vQQs3
         P+mjK3bnK/Tsa/y3lgPnoCSvSJbs2j87+GMbVDg3j9OYX0gZdOAxTTKJHTxjoXOw0Gwx
         0DKKNqPgam6bcmtKcoMyNXiATqMuN8yiT32970gwjqs7o9zipOX4DhXrYhTml3lKxizt
         +ishB81w04QpeSmjviwcPT5P0aChisMAKE13nexWROtuY9dinTAdSxKj6PHKgtTQO6OK
         fdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708560547; x=1709165347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiZ2wjkXdUeF2DZJw2oBIl8u+9EyfQfZ9ycNkF8fAgk=;
        b=rFDYZiEh+R38aKMB5YsQXgUBGy6JY5qxg2Kx3Tkk6Fvqk6sm6Ft3hhthLdrbOwz36l
         H3fGoLPWYOIbGWx8W2tw8u0wiP+ltMusTnY1EQMlX3gr2OQug3kJIg+OolCHV8LZ922k
         ucD1LsnP+TV8tq+xtLv+0EIkF2g9oR4ef/JfZYhq4CRi+JGMYAHVXFl+bwGBeIVrztS/
         Wrg0hh+/orkf2y+pxELxJ4hpvpsOYcd8QbHqytDvstzBWdLArc8xtf4O+IJj/Fl2fCIh
         VwEY2IDWMErTwUYf6/yKmEXTePcfNHsPFCBEhy+9uLdzxRbha+V3M+fctcuec8SmZoe8
         y7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVMpHJgwscfNfB9mycZ9TaAxsc61K40I17bfg0v42jOQlo1gCnbaL64SmnrcMp4AblCd7h9x8cermj53rGkKS8TegCJ2vjgwVxW
X-Gm-Message-State: AOJu0Yyaywq8U/ZUTfCk6Lp0NzjCdrSbn9U3NpBuz4Yvfjv1gIqCDjZB
	qTSsDSg/53zgDlZweWpSKx7xSPCFtGIB1+IsezWgj5lf32BN1kJNoy3PdMTr56w3VtZqF50NG2/
	eqZU4segkmVQP/XDohEBop9V+zBj0acw6VBZyxw==
X-Google-Smtp-Source: AGHT+IE8YdNcoy9yHPyWH3FSVi3grCuLLJ8fT8RNUBKoMQxE9UzcTUruywG2qiU3pKHX1/up6wOF6uOUyIuOPTAbvgM=
X-Received: by 2002:a05:6102:953:b0:470:605a:6a4 with SMTP id
 a19-20020a056102095300b00470605a06a4mr10156813vsi.21.1708560547208; Wed, 21
 Feb 2024 16:09:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-9-surenb@google.com>
In-Reply-To: <20240221194052.927623-9-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Feb 2024 19:08:30 -0500
Message-ID: <CA+CK2bD-AvHR45zWrLOGA7Y=HQeFf=Ty4vCB5bWxbX7XyMsYRw@mail.gmail.com>
Subject: Re: [PATCH v4 08/36] mm: introduce __GFP_NO_OBJ_EXT flag to
 selectively prevent slabobj_ext creation
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 2:41=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Introduce __GFP_NO_OBJ_EXT flag in order to prevent recursive allocations
> when allocating slabobj_ext on a slab.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
