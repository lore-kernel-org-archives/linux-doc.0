Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186FA3218F
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWcQIDL3"
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8C112A
	for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:01:56 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d9ac9573274so9052017276.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Oct 2023 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697731316; x=1698336116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAEbVxck7NIMOPFoyufkI7+poSNQZD0kt5lDnU1GmDY=;
        b=wWcQIDL39rUsqDiUSrhQesgnzs++1sOmT2AoGZrzDEHpC54Xf4PF5W+6I54F8wl48j
         vSBv6uBvlD8ph/3X/5lBMzExPF1JTS6nrfITdCQVZMyhTt3j/e/yvchiZCBj6vdyaDPh
         XYejc/h1rMFyc//XMgw9foepsVhh4rqBS0xBYFcRpBxfpvOMUMqxtireJdDFfdwPCY/Z
         MoOFXj4BBDkybxTC6R56DbyCACXUSEyXfC7wV2tT7ONbfS9mlowZgk3PRz4a42s4Adh7
         5SP/xuJ3oQmuiqU2qzrRpWB675P9oMtGRiv+HsZK83dsq76fWpRFoyJDLXSe8EKvpMQZ
         5f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697731316; x=1698336116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAEbVxck7NIMOPFoyufkI7+poSNQZD0kt5lDnU1GmDY=;
        b=W8K3rGMK41vltxRT41cwEFEormaXMbfT3h8vrLFNzGXCpSRaYPbWECOCyC3Z54+p+L
         m6i2ErdNDB/sWyGxwUoUKd5iZ/VDzKlpEch42xqQ3LYhUmQr/DnCBvzcXDm9yPYvUGAT
         fGnvr3U89oOHB0zQJkONY90n9XEJqey89CHleGslmWvjsqLXGXqqR9pcqloLIo+Zaz9h
         PRJAdvcqXfcqIW21qR3ExYqnvqWE8gkyz812oYZgXUr0XJGE5CyFk0hab1NJP8Z6I2d5
         1LxTPMx+G4E1iC9VxO7krkEby0h/wNcTXgOI+sfEXVSn1B7zfg2hE0FW0YfA1kKUBslH
         rQbg==
X-Gm-Message-State: AOJu0YwzXGlhbzCFCgwsNK7qNCmntbZZEHufmZZuqiWoi9/iZGvvSLmj
	RKUPCXaf+iRL9Pf2ExoYGk+5dNxwcSMOad5pTiHnCA==
X-Google-Smtp-Source: AGHT+IGcA4f1SZU3KuXOFAud9yeTFGruISOrerlndO0A2eRzNDv5uXbJb5LMllwxmz+k5CXCF6OOr1VBQANuxlqvmBw=
X-Received: by 2002:a05:6902:c7:b0:d9a:e6d6:42f8 with SMTP id
 i7-20020a05690200c700b00d9ae6d642f8mr2773004ybs.29.1697731315891; Thu, 19 Oct
 2023 09:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009025726.5982-1-link@vivo.com> <CAOUHufaX35Y6MfwKj_XUWXJwdC=9M=g1gXpQpQghBZ2fXrkEAw@mail.gmail.com>
 <CABdmKX0xevnJfcgsDEWsfX9J5T2x0EV7x-p4ommq_Deg98WwYA@mail.gmail.com> <d9b31019-9374-4531-8967-d289af3f4f06@vivo.com>
In-Reply-To: <d9b31019-9374-4531-8967-d289af3f4f06@vivo.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 19 Oct 2023 09:01:43 -0700
Message-ID: <CABdmKX21QfTDXJ2o=CbATmeX1OSgB1XnM=escE7xf8gMrvMhGA@mail.gmail.com>
Subject: Re: [PATCH 0/3 RESEND] Per memcg lru_gen node stat
To: Huan Yang <link@vivo.com>
Cc: Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
	"T.J. Alumbaugh" <talumbau@google.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Suren Baghdasaryan <surenb@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 7:32=E2=80=AFPM Huan Yang <link@vivo.com> wrote:
> > Android can't use debugfs in production, but I
> > think we'd prefer to use memory.reclaim for eviction anyway because it
> > respects memcg limits and reclaims from slab.
> Yes, shrink control this actually can use proactive reclaim.
> >
> > So maybe it's possible to add just aging functionality specific to
> > MGLRU? It'd be nice to know how you're going to use the aging, or why
> Due to debugfs not always mount, if we want to now lrugen's info, maybe
> nice to offer a memcg's node to show per memcg's lrugen info.
> > you want this version of eviction instead of what memory.reclaim does.
>
I think Yu's inquiry was about whether you will look at the lrugen
info from the memcg file for a production use case, or just for
debugging where you don't have debugfs for some reason. Because it's a
long term commitment to add the file.
