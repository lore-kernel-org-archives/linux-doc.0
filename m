Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BAC36F43D
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 23:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772060785; cv=pass; b=ADyBxedmidn4leWg8CiALFFYVpEp0HObq0/oW8yH0LdbmljaTIjuMHtsQRiNa5lKlrSuVTr9PFxppvzA0IADIEZzRSdnPs4dAiNmxchGF8fz9X8xzCO6B90mf7AJxEkJWFwGvG+SJej4vwdtJdvGHxpm1gGS7s5e1JjpdjKAojk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772060785; c=relaxed/simple;
	bh=W9lyoMsne8FGHHrjNNek3nZgafGdJjKzjxdCf0mXseM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LumJ8wewQR2wM4+xES+Q85mNCoBWqOjajs8lrQU8Q+yCn2MJ2Xo4TVzuP/Xu4XX0Ba2w6OR927R7vn8qEx24s05DouImCughtu217nmE0ZkUpG52bi9EyFc8tR5MVoJvrXcx7Ld6YzfZRcYBUZeAzIGYF9ldp5pqvNWscako2P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mNKSYhCo; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mNKSYhCo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2aad8123335so18355ad.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 15:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772060784; cv=none;
        d=google.com; s=arc-20240605;
        b=bHjeMBNcNiLj1WN62ugJrM2jqGeh6HVFS0j0cxKVmCPFKNZ8q3F3oOuykVEY+HuvZG
         g/2RXqTdIl0G/vBDol2OOHQ0fHthAqjDrBK9Wb1A7YbmUWQC0fPSCEvg/FRuBfqw36sw
         PfylwVctfWmf5XuqXBpnGxzGxb8w3Mh60bYw2NzcgUJKAV9zL6UMvYlhIvdf3ERfkomA
         5QLVqv8oS3z3o3eNjtSk1Uv1wAWXnr4wx0MzXLRWaSWbSk8Dy7ar2qrBSGjHRXbb/6l8
         XBWTjLpvWCGCJ0DEGqS15O6px75+m6bx7M+8m7wHBvFz6dGlZgHnsg1JrQigdRQ+tTzG
         k28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OCcej487YgFKOPTEV46nBBjzZMXcrtqh5hw60mHgWDA=;
        fh=zOCTkWoCQDl4h9jEb1XatIze+DoCB2yhgBqOIau5mnI=;
        b=D6/to9cTIT0vSOIZCi/yQXa2nnoWfeL3kWCvy+4u7ZpY6aRciox9PdKPFbN3t/w4IC
         /pFQzCFvX/9lV8COPe/hF+cJ2Rzn8/hOCbJ+TrSAIKHKISnB/3I1fZR7NGDbjBGoq9yo
         hyJFNexFb+K1jiBI9nmAOI9uqGS2TTkACdMLqx4H/hKoWMb+jkztKWGzd90AkbEpTteK
         XvYKTvXTee0bMnNyqSa4sjGTbQ6k5xlNQ1NQ9nayjjbzDd+rK3jP/PKHuZcnWtckhAOi
         sF9oJnUnC6Yfbvwj3XvaFruNpKD0Tbt2yy+RryPg6H8RrJIaGv+ri4yi4febzLIRNuOE
         z2jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772060784; x=1772665584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCcej487YgFKOPTEV46nBBjzZMXcrtqh5hw60mHgWDA=;
        b=mNKSYhCoR7SxKucy/Yh3pA3CvcKRSJO0SZQka7+dRnFeYEBHJhuxHRK5K4guqPK3Tx
         ZPNS/ge079zhRd4l2+Ax41E0gZViPZFcdnopLoBctPZXyjnmcoKC64Q5IrGiEhT7jue/
         V018R6YpDBlvhkbmNL8gKl81qVDrrODrA17hOUlFDLXrIR/JMyZgzt3SJvH1UZeTNbno
         ZV9cPKcqgPe9YpcWXn6iIN7VyzkOjBLt5oIIFVlTLluR99TidfG0fvtr6g4LdR9b4UZk
         9b+poH6zkvu8mPZgnusqpzAK7MsRYJfkR+EHAsgv6skPoYQ3UY6BDlAzAeHqT62HBC+l
         93LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772060784; x=1772665584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OCcej487YgFKOPTEV46nBBjzZMXcrtqh5hw60mHgWDA=;
        b=PjaJ1mP8r3r3gkyJaChcJ//e3DOrdg0EWWMKFq0AckQWdLTOPUxRLVBJvBnhTXwGqI
         W5a0QIrIPi3EzGa/BFfQtX5M6sXlNakZosV8G0uyWRFG3wDzrJgDTgUD6vRYwwhHt2hT
         o/y+sl+1CvaK1fVsvQYQ2uVzp+3T7QDB7m192MjN2cNDpDVcXq1l4GZgG/A5WqEFTLRL
         0TE7ai6h6LhhCfT2RufIDPWzdILauV7GrX1eL58jGoQFe/pgwEsb0YWXEOaNTq5ozPeN
         Yf2OjlHs9KJUj9QpT6HUZ5jx+rHIcK/XcExSRLGcGuQjbkp3kbNHGECxYTfLfAkRXvKi
         CVbg==
X-Forwarded-Encrypted: i=1; AJvYcCWBzSo4uF98Y4gGeukg3qiqeMZbJAgYSPMIC6grLtGz+m97nJYaaNPtrLuqN4aw3sgBVOg4eUnCkzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2bnKU11KYVadT/QWsDVzcaRzxK9LaDGokdWfkemXkI0zWjbq
	eQ1p8kj5xnGdkkXno4wb2yVB0NFit+Kh4tN6mMyvY7jGG/TIDSxO6rDa9mOS96MhhxPOzYKRZCl
	frb+k8mL3JcQh0svVcN52fe/F221/2ET8Kd4xH65x
X-Gm-Gg: ATEYQzw0Dh+ScIMbGoeb68ib0tnbqNdsKRa0z4LeUHP8btKknb2uJlQfICbFHKfxpwd
	ORnbyxA6CCmAUw1JXD/Eg4V3iU5DkkJSEsUwxVlpnfj7fryKmNS8v06Cn6C4puMBAn22XuCORwq
	9D0VjOaMW7P5eaD3FstojK3GJseqU+ch8da4ZmB0Id2HeFY77Yxudo0GT38A4Hw8m0UNMCX8Ktj
	hh8arbpeR0lEoymoHHYEsRydZIhs68/OO7qfGqwt9l94a3HPYCgBi/bRdF7nMlsT2PjTa5JWKgh
	EHUblgAS+nm/VrMF2cZU81YlYJIJ80XIwEydvg==
X-Received: by 2002:a17:902:ec83:b0:299:c368:6b1f with SMTP id
 d9443c01a7336-2adf77829e3mr890095ad.18.1772060783430; Wed, 25 Feb 2026
 15:06:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820010415.699353-1-anthony.yznaga@oracle.com>
 <CAC_TJvcaJdEzK8n9BK0qgEXdzjzXtbA_Zk-ybfmG8kjNExVCzw@mail.gmail.com> <b82a5ac3-33e9-4cbf-892a-f0c7f6fe0c20@kernel.org>
In-Reply-To: <b82a5ac3-33e9-4cbf-892a-f0c7f6fe0c20@kernel.org>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Wed, 25 Feb 2026 15:06:10 -0800
X-Gm-Features: AaiRm53L_V-Oqt0aKWGxGR-IMY7YR8csbAzuy6C894gHyFaSj1OZXeEBVl8_aWU
Message-ID: <CAC_TJvdgvyjyJsU4v6W+3tHKx_2e8UMJU3RT2HKLSngcC+yH3Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/22] Add support for shared PTEs across processes
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Anthony Yznaga <anthony.yznaga@oracle.com>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, andreyknvl@gmail.com, arnd@arndb.de, bp@alien8.de, 
	brauner@kernel.org, bsegall@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dietmar.eggemann@arm.com, ebiederm@xmission.com, 
	hpa@zytor.com, jakub.wartak@mailbox.org, jannh@google.com, 
	juri.lelli@redhat.com, khalid@kernel.org, liam.howlett@oracle.com, 
	linyongting@bytedance.com, lorenzo.stoakes@oracle.com, luto@kernel.org, 
	markhemm@googlemail.com, maz@kernel.org, mhiramat@kernel.org, mgorman@suse.de, 
	mhocko@suse.com, mingo@redhat.com, muchun.song@linux.dev, neilb@suse.de, 
	osalvador@suse.de, pcc@google.com, peterz@infradead.org, pfalcato@suse.de, 
	rostedt@goodmis.org, rppt@kernel.org, shakeel.butt@linux.dev, 
	surenb@google.com, tglx@linutronix.de, vasily.averin@linux.dev, 
	vbabka@suse.cz, vincent.guittot@linaro.org, viro@zeniv.linux.org.uk, 
	vschneid@redhat.com, willy@infradead.org, x86@kernel.org, 
	xhao@linux.alibaba.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Isaac Manjarres <isaacmanjarres@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	android-mm <android-mm@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 1:40=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> > I believe that managing a pseudo-filesystem (msharefs) and mapping via
> > ioctl during process creation could introduce overhead that impacts
> > app startup latency. Ideally, child apps shouldn't be aware of this
> > sharing or need to manage the pseudo-filesystem on their end.
> All process must be aware of these special semantics.
>
> I'd assume that fork() would simply replicate mshare region into the
> fork'ed child process. So from that point of view, it's "transparent" as
> in "no special mshare() handling required after fork".

Hi David,

That's agood  point. If fork() simply replicates the mshare region, it
does achieve transparency in terms of setup.

I am still concerned about transparency in terms of observability.
Applications and sometimes inspect their own mappings (from
/proc/self/maps) to locate specific code or data regions for various
anti-tamper and obfuscation techniques. [2] If those mappings suddenly
point to an msharefs pseudo-file instead of the expected shared
library backing, it may break user-space assumptions and cause
compatibility issues.

Perhaps we could advertise the shared VMAs in the /proc/*/[s]maps
entries for the processes sharing these areas?

[2] https://lore.kernel.org/all/CAC_TJveMB1_iAUt81D5-+z8gArbVcbfDM=3DdjCZG_=
bRVaCEMRmg@mail.gmail.com/

Thanks,
Kalesh


>
> --
> Cheers,
>
> David
