Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7DC24B240
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 01:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736559252; cv=none; b=nQ8Pl9TlUfKbAPKCdt0QrUQ0emjyFG4BpW/9Z7vHQouX30Y8QsgC3Qc3mRSdKwjHQ10dQHYtOg2AwRGsKa7fHZJhRvL1r6ec5gYKw6lvBqVXJFwFX3QzQUVnq7EQVoB/VYfilT0wPUAZGwVRYRiWcfGFPJLr33Rq42HYFl3g3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736559252; c=relaxed/simple;
	bh=JEUh/+d1BmGTQBj+1pBImNiVXvqB0eqaD7CDLj0ojrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hmc5RF47FAEd/hIst6ZTYAl+s3oo/77srawA/nxamPbep6qOKV0I1bazLrWLQvI3ncCeSQBl6hk/3OqGar8JLd/B1PhmS9y3tH1bArGuDztWJN3X0xCxLlSuCL0+LvE9tiHFwQGR1JZqALyUBL1/oZpOZLv1JfnexsKaKw4LTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iS4nyDs1; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iS4nyDs1"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679b5c66d0so97411cf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 17:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736559250; x=1737164050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEUh/+d1BmGTQBj+1pBImNiVXvqB0eqaD7CDLj0ojrY=;
        b=iS4nyDs14EvqJvpXeLOuvQXq4aarRgGlaytLW3dnYR75G1fgxBAA47HiavTnGsSjC5
         4OTmNfRWv0L2d6eZ/rqarjZeVjckD2T9I1mOj4LkDSK3gIR0/3+4wJ+AjC6WjB33D+V7
         geQuMPxp30S1R/2Hw7mX4zdVUlznIbRKQWaUBK+78hScL01rxzOQMD5opB8uCiua8Kpm
         HD0tDBgA/ZNdqm7lukGOnsdOF4n9qArKYhU1i/Q//rN4SRkMoDckavhCB/W+3pnQKBKE
         max3GBu/ezTVKPLXVCW2pALUtEqx51yc5rr6BpRJK6R/iVGOw9fqp55fQwCgoMDf1NF/
         k1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736559250; x=1737164050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEUh/+d1BmGTQBj+1pBImNiVXvqB0eqaD7CDLj0ojrY=;
        b=wogAkacN/tLUtQW7TpywzuVaniDTi4q19aL4iVM42qNaevGvdLOBwEW1MRveBpOBXb
         NU52TvrQN5IrL0AE0zcCon1VWbC7sefnKfofOprSEpcsp7akWMRUxrsSMOszuYUMSzfc
         BfPKfGwhwKQ3ohxPfBTXxCf6vFcb/vM+dvPd3dTxxfzeGkfOISY+i3I+1WK8NUf+Vc1J
         3cRE4ok3hL70bT3UTEm+DGE/SL3Qs+b/p5cePzoAokwrlgy+AWAONJIHDNXvbR19rsC5
         cXRqwDuhsX3Gu4jYRGqAso3pxKlei+vVSSVri+qlSeva+wr14z1/SbLSd3AlfZwVk8y4
         m38Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/knjnMlPPukWjAzU7SrOUy/SR7DAKuqjoJjasebamFKTH6548xl53Tcql0UtiwwjNfN/W/7oISCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvux6Ok8+WKJi7P/GcxfupBglazA1j/LITq8vHN/KrQ6yMuaLr
	NtPKjWj1fYJQvH7hXA2AFGvL9aS3HwaH24AW63Wxj4+S630XPWtA4nqKfoveAo6O5GXOK2tz+cV
	P2AUcBTwqLaxNSmhPhU9Nu+khAqj4WH08jQt4
X-Gm-Gg: ASbGncvXxdkI4yZbQhMc7cmTxJRz1oo9iuATesXm6sD51YAdkAQP4qo4WHvjIOyOkpu
	Cd5uIwkkCi0OfbtOl0mWUxyThdSkMUs8bq5snuxrG66BQzOHKRPgQN9kd182Jx7a2JcL+
X-Google-Smtp-Source: AGHT+IGHbclh7SZmnJswzscNXROgeqOcz/CwjWYYVI1ybbrckQeiqbl1iyMXqypPWgox2k4LVk0udD8QWMnDDVS473k=
X-Received: by 2002:a05:622a:5c91:b0:46c:78e4:a9cc with SMTP id
 d75a77b69052e-46c89deb173mr5302301cf.25.1736559249750; Fri, 10 Jan 2025
 17:34:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109023025.2242447-1-surenb@google.com> <20250109023025.2242447-11-surenb@google.com>
 <c592118f-be6a-4d82-b925-80e102a7aba2@suse.cz>
In-Reply-To: <c592118f-be6a-4d82-b925-80e102a7aba2@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Jan 2025 17:33:58 -0800
X-Gm-Features: AbW1kvbGyQtSOr1LzNwk5Tqlyagko4NQcl1ELQtkqqfKknNPKVxB25pZ-ZXAH4o
Message-ID: <CAJuCfpHfb6f+_o+yj5796Lswwf-y=iu3gxyq2MZm0XFUUuGx3Q@mail.gmail.com>
Subject: Re: [PATCH v8 10/16] refcount: introduce __refcount_{add|inc}_not_zero_limited
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 6:41=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 1/9/25 3:30 AM, Suren Baghdasaryan wrote:
> > Introduce functions to increase refcount but with a top limit above whi=
ch
> > they will fail to increase (the limit is inclusive). Setting the limit =
to
> > INT_MAX indicates no limit.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>

Thanks Vlastimil!
Since per David's suggestion in v7 I'll be adding a new static check
in this patch, I won't add your Acked-by in v9 until you have a chance
to look at it again.

>
