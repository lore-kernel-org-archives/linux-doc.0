Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C5E38A733
	for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681679; cv=pass; b=YhQAXoKeUkAbIb4vfpzSMc39h8eQSyxvsbogfqmSeo4YG9iRXgguTBAtSX6wBunge/+/QSsISaFC4qlU4PMXtyYYO7WN4iEO0yZiAdXWZIcNYXkbO9IDs/3BLyS3jfy5ef0mXXYre1sghMbm5Zx5zsfd1n45/zLlPPJ6IP9IPEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681679; c=relaxed/simple;
	bh=q9clkba00KWEA/ZYqovhY/H/kT7YKOCxKbfsdjAbzOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2cNrXiYBZ+LIc7/Ti9Tsw51e1RdoXiC9MU8gn2W0uLCWKfVg5fcnxFsrP/N8+1wRiqtztVtL8A+g4eVkdGV/Lqc9fiZpVHtmyKiGvPfaWpgZ3n5d3NBGs/UjI+zd2V+CI25WFpQc3ke6qk9WCarlzljnH8GkO7i81hhMZYGn4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qf45Cf3Y; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qf45Cf3Y"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d572f7437so1894471f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Apr 2026 03:41:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776681677; cv=none;
        d=google.com; s=arc-20240605;
        b=H2BPOrT2aJV60XdOzyg/zaVfo7KgAoolH4/sTdyL6IfafN3fI/FqhY4Tp5ZzLIzd9K
         rG6zQIBuPw1GPEp4PZdg8hrv6aFCqg9H1Q1Fss1GFy/OucFWIUBITtGaJ1XvrHsYWbKt
         zRIEeWeTuxyLFtqUKfJCv3IJ59Qem8S68MLSJ9+vqj0SVpAg1Pz7tKfrx/mAKXix+XIB
         VktLd/CjfWiWoaSPyQTtN05/Ik1TKsYk5PlDOMK/pzn7ly5KNINzRiOc523qFdrY8iYk
         nc3lb9Bd0f8aBkI1EyJoLotuoa+hmsVIW2r5fAo4eBOakaFRNpsYYEHy+1HfhaLgfizk
         7Dtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9clkba00KWEA/ZYqovhY/H/kT7YKOCxKbfsdjAbzOc=;
        fh=qGhd5U4Oq4erYlT2xR7SN1r/u/RVH3tbMg5RwhRIDNc=;
        b=QHOaUDIqvHGY9FueAwy+v/u4Z6kFJh2Mb7tnxIoherQokzp1Ap1uUtTOPCBG5hY+Gg
         f2iblQWkbcwy9N8QhmZ44BM51U73MbVOmZpbaov/UwbguYlhAN6TBf4J45JG3etoqLij
         R8sI3rM05qMmZnfQHqya3xAvIQOdOFDPMRZLz6avFmt/GDTD9Wq7fal7M9b69XGHlBhn
         X2gPNPNSMw3Ce+bFAjeQ/1Y7UgV3Wzq+HUQZ1CQW37AZVdUvRU76JgVkKouyqtak1/CO
         ZVhQ1OE9lTSA1072BI/qV2XpRMNJzcQDqx4UWUgUi3Fgg7SreDavDPzsDGqdiJdFdmQy
         z2pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681677; x=1777286477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9clkba00KWEA/ZYqovhY/H/kT7YKOCxKbfsdjAbzOc=;
        b=Qf45Cf3YRtySlFrwAwA6N4C8jskSZcaZxU+IG3IVqDjRPx2T7GIKAFH5+AmfvYBA8y
         ZD5OIOl+vyvEnqaNCXrKsHwgOMFkLssHpgemOAFLRgUeXAs8/kUJy/Ef+5PdllWv9P4i
         MLCMX/oT/r5igQIpSlWgXGilLxQazy83p4a9Wlgyi1Mj3VkQaOLK7bJKBFEWhVjX4uzs
         isAYfRzevmitPiLyFNBGBdClCZFMIsEDfhjB486cUT/KdqWINmDGenOlSlHzErGpMLkF
         OgRpoa8q/PKkklthE/43KE2Hx98gMLw8LsaavvrKTvNn+sGGVL6IfNyc9t/clDgBo0ox
         clRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681677; x=1777286477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9clkba00KWEA/ZYqovhY/H/kT7YKOCxKbfsdjAbzOc=;
        b=qe2fHaMYu7X+6m1piI9urZtidDnKX7SlrvKXgvyNhzVH1hi9zuoeX7MWCKAGZfFqkp
         AJU5MvjzA0IOR/6jSftaJCs5QefxF8D7RlBTr6UmN+1PmtxFV1QwGqlSF2rNggTuQNU4
         ZStnfH6nJ9Cly3QapIL8ypxqm1vDN3L7JNrXwI57e7yoh2S/6vgwmMPpeM3Bgtpc/uhb
         9GZTCQ3CBVMe12jMYkBgeKL3L77wJhuLSj1Oew/W7NuM53DwxGmZjkk29PlREbl1uYDr
         bMgXHn1r5JMWE4hb09oPOA/88JmrUWbt96RtVGohc7OCi1akvyE13mHkRd12ZPjZr+Z4
         kN0w==
X-Forwarded-Encrypted: i=1; AFNElJ8rqL7IsqDfGMzM8y+Ko+3MstBUwC9AFNIt3OGMcU8Qy15dQekqptNwH6Rt9EECv83QfwznyQ53pWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtG3+DzemgJvihZUFp7P9dbg5+SxLMTnoeFsNL/LTT6k5gTQSR
	bC34wXF+u6Xv8tzR+SUWs6ayY2h8ZDWpdsPKF9EdP7CdPzBjWM3qMcWRk63mHN0e6zDdXeZjrWm
	ZfGiRONoAOfoAKr4AkoerZMv9lwsOcAk=
X-Gm-Gg: AeBDietxlzM+D5iy7KFz1q1DPgSiBF8xV4DyZV1QRG+CNbDBzArp2fJS1/MZOGzv9pS
	bKXdv5GmessqHWl90x8/3zJixRBWYoOPHbmRtyJsWi+6M9YMk90URssU96Snb7zCTbRQjv5UZK+
	ppLJDRA9qGcsq/d7qfARhdjxscFunqQZ6fYkG/ZIfXj/2v1iHLDS1yp2FvCR53p6jEgEv56eG5j
	bbnDhNZtMkmJRSBVSn1IOlTP3vWb4931l5ghnsRn7SUd9T+FfeEg53J1RiBO/nhL+w+UP1Qu4N+
	VHljOD5xsmOza44yK434Nb7MkMghJpUHe20k6hwjDM+k7KZXJBKgIhKN/u5HPPS5xCGQ9twMXdz
	mGdjB/yU=
X-Received: by 2002:a05:6000:2008:b0:43b:4982:fc73 with SMTP id
 ffacd0b85a97d-43fe3e08fc2mr20693373f8f.25.1776681676573; Mon, 20 Apr 2026
 03:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418000635.17499-1-sef1548@gmail.com> <aeNGbNyPxJssnkbO@lucifer>
 <aeOuCH8ydw_yzdXZ@casper.infradead.org> <c113f667-f897-42cc-a0e5-b8a0bbd91be3@kernel.org>
 <aeTTw4gziJigaNbU@lucifer> <CABZAGRHXtjzGJrgR1NAmVHFMP9eL5zZr3DaTAtAvywv_1sOHdw@mail.gmail.com>
 <aeXK4tjGFUgKDf5-@kernel.org>
In-Reply-To: <aeXK4tjGFUgKDf5-@kernel.org>
From: Nick Huang <sef1548@gmail.com>
Date: Mon, 20 Apr 2026 18:41:05 +0800
X-Gm-Features: AQROBzC4ljRClvtz08XZ0zLObZqZYUi9N_8tV--smCClyUXbbmXC1JSubeEDUHY
Message-ID: <CABZAGRGx+7Wbw1G+sjB9cdR-9C6PdT3OAWPMd=UC=5WHrnvV1Q@mail.gmail.com>
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab documentation
To: Mike Rapoport <rppt@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mike Rapoport <rppt@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=8820=E6=97=
=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:42=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Nick,
>
> On Mon, Apr 20, 2026 at 12:52:25PM +0800, Nick Huang wrote:
> >
> > I am really sorry for causing trouble for everyone. I would like to
> > ask which aspect of mine was disrespectful, so that I can be more
> > careful next time.
>
> Maintainers time is valuable and sending LLM generated patch completely
> without understanding what it is about is disrespect for maintainers wast=
ed
> time.
>
> > If I want to make this kind of change, should I send an [RFC patch] to
> > ask for everyone's opinion?
>
> If you want to make that kind of change, you should start with researchin=
g
> and understanding yourself what the code is doing, double check the LLM
> output and verify it and not just take an LLM slop and send it.
>
> > Sorry, I really am not very clear about the process.
>
> Start with reading kernel process documentation:
> https://docs.kernel.org/process/development-process.html
>
> > --
> > Regards,
> > Nick Huang
>
> --
> Sincerely yours,
> Mike.

Thank you for your suggestion. I will read the kernel process
documentation carefully.

--=20
Regards,
Nick Huang
