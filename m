Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B75E364024
	for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776510061; cv=pass; b=cpsNSOqv08mDZY3GbltO9GKeWXwHO2Cjobvdeg6CjRi+5o3xzl1ERbdO6YXCpHSMiBO4LAw6+ba9f4YQofH1xrY6WuJMFbAWaKiEHua9QyOYtu3jbxbX5zDbnxudmZAKKGo52kVqxL4eXDAwTo0rg40Z44mNgDBB3LTMRsaLaek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776510061; c=relaxed/simple;
	bh=KY9FDmf/9WVv8g70PDtqy5k3Dg+uSpxFrEmWBPNN6G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jtux3GeZJaEcqv5O+eKmG4B1Bd9Cg0k+LLVcdh/r4TgWI0wMA1UjA1OfrVPNOnHG7Ha/HJzbykBJ+6F/qQ9PEEyb27yk3JV1juGpOi0Y3xEEiiH3LY41hREBTRvbbflyYQnrdQRsxvG0DOR6z/KuhHyBRsjkOE2ffIhuOmcsfgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZjYWCpx; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZjYWCpx"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d03db7f87so912713f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 04:01:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776510059; cv=none;
        d=google.com; s=arc-20240605;
        b=l3hFAM6uqC555w3lgDppRDzYMwCfobitf3cgcJweJSVwXfuxYbcmzOoIMgECZUnXGE
         mfdcsVEK4wlBoNaWJZzepvM707FVp6IMXNjz6wgR1BVN7GvF6lWAmL0KGJK8W2iuU9T6
         5VrAMcLFMYutSCRScDYMA/QmCZZMa91eMVT+0UmJ7xP18GHm3SCPHFIYUdkN78n3EJHl
         86NPmVjjSjPg51dDxEgp+rjjFL26JuxlDkqS8f8tOui+qPVY3wrbaIdqWlyAb8FB80rn
         8ri1GFYqe+f+Djpk1tOGZPCg2e/H4+iJu7/zKfV06VdKqA+/7w8pMVujB0deWITjg+i/
         g5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KY9FDmf/9WVv8g70PDtqy5k3Dg+uSpxFrEmWBPNN6G0=;
        fh=KhVTY0ck+bs1LNlhDlmGaTL2UJ8QGh+xVruz8rty8UI=;
        b=Ill9zMAeXvi7UtyLSj9Ba0+CEOB6BNtDKGC6rcUyEhEWBLEzXxZ6+/t+U1JCHngkzP
         q+dOjH0zVsl784crDwMqlqQmNAeIL+5dPbPx8cZ+qwkDW91Ret3jTu1B/9/1cJ7yQmGB
         hrOIgGS1CX9WibBq2hF/ouuj9GYVHpOdnj2hz19TF/TwGJVoHFdRkm/NsA55T5YNhOwX
         ia4lDK/cJ2FAByeH+P1ot0wMdiS2HGHChSoseQpf64rH2dFc1aQpgMTfm2Y1znnRTPYg
         cxRQX9QSwuPIUiOeVEjkMYtNj1QH3+2m7SGBwPO5u4ttab6apvkoWHCkKU8JP3teItm8
         iIGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776510059; x=1777114859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY9FDmf/9WVv8g70PDtqy5k3Dg+uSpxFrEmWBPNN6G0=;
        b=qZjYWCpxhgKhrpMprFiX+N0SkWX1thzrq7wanU/9ZLcf7thVEKO7fIfiXEn6BlP0yF
         IphEXGyDiiGdVdGfc3smTLNhVa41r/E5PD/ksYq4Ytw1ZnvHNGUMKHzz5iG+wbR75PGe
         CBgfxND0CR+POtdmaXtU0u/DXKfGyy06hMvdXTw0p5a4hlEilUQx58J05ZxuW4xNclKF
         QyBRa+GD8PBTwdzLG+SKMFVFPvqf7WfE29ezK57CCGlEZBDwBhYttjhFmc/rq4xJSuTC
         yDK4KkN3OOGk6DqpJd9kVvcbsHuvIOH61HZS9cFsNjg+cHVNrUFwKfqmRx2AMzrYOhhU
         ZOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776510059; x=1777114859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KY9FDmf/9WVv8g70PDtqy5k3Dg+uSpxFrEmWBPNN6G0=;
        b=C5ervhjRrjFSdoXsW1tpIYUso3wHwGfT1JPwZNNQYYvD0FAIIRKccUa/pq4uRUMb+B
         dvkDvv69UUhNiHAymX4U44iG42nuqMVJZ8y2EkESapGBOIlJofL9hYrigjlXtZibCQua
         tlqMP23oYKf7S0GL36ZMfMwN4+9LKXLOXahwzxPL8OGpsMyUi1LvlFTunwQTKN0Qybd3
         0H+8WN+SVRTvm1m73vxQueT6d2itl2nlp9M/rI3ov0UKivnzMuTanwfwiJZ55+2eledG
         l0lCEdO7Hkp0RRJn8IhIdd4rxSEsdjrvSVxckHImRdXV54i+DndRGEVg/J7qwqvFuOgT
         +1gA==
X-Forwarded-Encrypted: i=1; AFNElJ+quYekGEc3Os5K1pQ03OnQCaUskF4q8sMklaSqeZ7+B5LxThcAOAwb4bHOu5CP08a/dCTLXah+qsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYrvdISaXCfD6mxRLKyhddTgk4FL0XGoOLSUxhhhAQZ+JB/BQe
	6Q3lIc7BWTJ9bC1jdzAqVM7fPcHuTI5vGQRd02fJyWGBbxGeKvDNAA1As+zkrSDBw9odwDYk2sl
	m36/tWcoys8/HVcGoWJkOSESyaV3mQtU=
X-Gm-Gg: AeBDiev8YfmnsyU48M1ZOPOr6rqKKq7nI2F/kjhQr7idjP9zpLTAeM3huabWsw0To9F
	aE4YOHVCjtmWqhV4hR9cgm5OJ9xSDI9zT4eYhcdxeDf1KF7R8/yv2PjD+BkRUi/7kHDlU7UNdc5
	GfVJl4KqmZa261TUrOExyWjBOU6aXLU9n8UV6vpNTqm2dPuM1wUoScf0YYFKW4Wms2uZAE9k8m3
	FM63q3FnouA+vL1xnuJD2ybSJNgbXXndcwEbWvAxRUTsN+qPTdP9lxRiR/aiow2MMSsNdOm/dNh
	6f9mMGIqLpPx0D3lSxriQzMY0CSlMEyEYiuEjGNwUoCaT/Qbt793mugAaFOxcLU=
X-Received: by 2002:a05:6000:2389:b0:43d:7ea8:62e6 with SMTP id
 ffacd0b85a97d-43fe3e12691mr10336752f8f.46.1776510058749; Sat, 18 Apr 2026
 04:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418000635.17499-1-sef1548@gmail.com> <aeMQ36jFnCKmCSyA@casper.infradead.org>
 <CABZAGREDHwsXMm65_WxEn=v-zTv7_eVqQzQeCRqU2Gyc0aTETQ@mail.gmail.com>
 <CABZAGRGFpiiEr7Odd5an1+9Z+sX1C6QT2iadv-0hNhxGj8eEyg@mail.gmail.com> <aeNKDh8S6pXHqRFh@lucifer>
In-Reply-To: <aeNKDh8S6pXHqRFh@lucifer>
From: Nick Huang <sef1548@gmail.com>
Date: Sat, 18 Apr 2026 19:00:46 +0800
X-Gm-Features: AQROBzAjQEWkZDpqcselXTdf--Plbsz__t87x58mMY0oY0BnRQbcqKaJWjYoYNY
Message-ID: <CABZAGRGCwM1PiSxennV-Uy9y1gGKjpcHeq+eOAbqSZcy3Qb55g@mail.gmail.com>
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab documentation
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo Stoakes
Lorenzo Stoakes <ljs@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=8818=E6=97=
=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=885:11=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sat, Apr 18, 2026 at 02:12:22PM +0800, Nick Huang wrote:
> > Nick Huang <sef1548@gmail.com> =E6=96=BC 2026=E5=B9=B44=E6=9C=8818=E6=
=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:27=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > Matthew Wilcox <willy@infradead.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=
=8818=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:04=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > >
> > > > On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> > > > > - Add "Overview" section explaining the slab allocator's role and=
 purpose
> > > > > - Document the three main slab allocator implementations (SLAB, S=
LUB, SLOB)
> > Hi Matthew Wilcox
> > I will remove this sentence in the next version:
> > =E2=80=9CDocument the three main slab allocator implementations (SLAB, =
SLUB, SLOB).=E2=80=9D
> > I=E2=80=99m not entirely sure I fully understand your point. If I=E2=80=
=99ve missed
> > anything, please let me know what needs to be changed. Thank you.
>
> No, please don't send any more revisions of this garbage, thanks.

thank you for your guidance. I will correct my work and introduce the
more recent `barn`, `sheave`, and `kmalloc_obj`.
Do you think this is appropriate?

--=20
Regards,
Nick Huang
