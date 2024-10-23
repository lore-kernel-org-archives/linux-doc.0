Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AC1CEEA2
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729704965; cv=none; b=Mg+/CU5YHhCzGFol3Kx3YrY0/X0ADbY8cQ05n7k3BaEhCHgydGwAzz3/Jvv8HdMopDnVUFefMCPRN+mMUWd//UXCzHoXmNI9OdpGKxBpGGcV+kQpPTCnm7WfAVncDBgym0BFVd9T7cNtOBjP3P3mBSuk98Q7I/nxC8F6kk+6B5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729704965; c=relaxed/simple;
	bh=spFboIypgyk3XWp5kghVBAFFeZk1pIkBkrhK+B/w9NQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+D/m6KvjYsCdmow1PEi6tyzsft29y/apXRnRoCydAmIT9xLFUcEkaT9LRUAIkv3aZsjyWgWEEInInHoyb8yQ8kNHLcF/XYXAXx6nx88Gx/x/XNY+3kDo6E9+JQLGZlay3466Y3fMdQ4z3RGkVaIHZTi9i0FTfBOXZLk9YSR12c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=GuzX14qk; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="GuzX14qk"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4608e389407so507531cf.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1729704961; x=1730309761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spFboIypgyk3XWp5kghVBAFFeZk1pIkBkrhK+B/w9NQ=;
        b=GuzX14qkCeGqN3E6465gmapHJB0vk57BfOaf40RmAdF0aZbjq+hYdVGHletdw/bxkq
         cM8XIAeLW8/aU/+GsNUxAVFYDToW8zlSNDMWUrSEUGqG+MWsLZ/amvpTXhabuA6cE4A1
         U8aeBvdgevCqur7ynOaQj7QKBn6gyH9PV39GHFBWxef7gYS8HpfBX9x8ACqJp2CP4n1Z
         DkVh6H+1G/Jjn5MS8FggfFlAAoj9d8T6hfbDt3JakCgXtdJ59bw+rm34kwrN2ayoQAM+
         ofhUJiM+KLYYIhAaAwbo1VxxJUHIR1YiOUOL7a++v+AD7b2+0y5TFG2/ZUUPD3h43CcP
         37dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729704962; x=1730309762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spFboIypgyk3XWp5kghVBAFFeZk1pIkBkrhK+B/w9NQ=;
        b=nZG9HzC1q8eNXfCvcdSFj1VfQ7XGaOffFXtzrS5LxiY1IRBS6CSCbOYhmI7z97o9g2
         HL7Tb0vALU94ZoT7m7gZTxz6aED+W8liHxDkPfERx0EA5AhDPc/hzPGH4xtX5fI4qCt2
         RVPBGx3rTGU7A2v0Q9dwY4aRUzENtiWnKIg841UyIhh8F/X+/rsM06iz9++R6l9UxewD
         GxjSkBzkLwjElMaukWCa46uGMjE1Nyo1l0jslxT5viO5YZYzgQgFJhOz5m4MZNsmDahA
         nScF4n0GHg6RwbWyKWIMBxt8eNdotOr3qywqDET9ZUioNqBbIki3TexblCaovdErveUm
         U5EA==
X-Forwarded-Encrypted: i=1; AJvYcCXeMLDLML+49YghRy6YBJjDNvjTx26X+7EcHOPjsUrAP24Fwa65vDZ0EASlk9inEOP4jJw49/B1gew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWoBPyJJOFQXTw9KaF+E3Ugo+7xb71wLuxpUKilVk6JLjt6bM0
	AFBqbOpv33EhmiMC58XO5UOXUJ0V7qNGqQFTPfOeyyuPpBNBqwvHdBFNlt/3w0cGyQxJW4q7u6H
	DfwoSjzB/JozKsMgXDI5iz5LiA7RNx9mXByNYDg==
X-Google-Smtp-Source: AGHT+IFV+lf1cZYVfoZTKRitSaDBfAqj+KRGY17augig5JAjskqsVjHe3OvS9TISaOCa0dNfmisxyapMIUhj1oFRM3E=
X-Received: by 2002:ac8:5e0a:0:b0:460:a942:e8be with SMTP id
 d75a77b69052e-46114714d4cmr43850111cf.37.1729704961651; Wed, 23 Oct 2024
 10:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023170759.999909-1-surenb@google.com> <20241023170759.999909-6-surenb@google.com>
In-Reply-To: <20241023170759.999909-6-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Oct 2024 13:35:24 -0400
Message-ID: <CA+CK2bCUqFeJdWqMiKRNEjWc15vUsk9YAbaLqgL5nAXM8ZkdBA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] alloc_tag: introduce pgtag_ref_handle to abstract
 page tag references
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, corbet@lwn.net, 
	arnd@arndb.de, mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, 
	thuth@redhat.com, tglx@linutronix.de, bp@alien8.de, 
	xiongwei.song@windriver.com, ardb@kernel.org, david@redhat.com, 
	vbabka@suse.cz, mhocko@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, urezki@gmail.com, hch@infradead.org, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	maple-tree@lists.infradead.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:08=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> To simplify later changes to page tag references, introduce new
> pgtag_ref_handle type. This allows easy replacement of page_ext
> as a storage of page allocation tags.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
