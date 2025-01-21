Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E59DDC1
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 02:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737426847; cv=none; b=QFommGoW5IoSjKDEJLIaYRg3D1ynFC8RJGsjQkLZM1+qWqP08u5adF2bIf3WakXhimHHbYiqv7RYpu7TUoviv4ahhXprhXydfdzCo2PSoigtRGoCLDjnQhdsI8ilWY2YaP6akcTU1H1Ucw7CGlv+CTaNHiTkTzOOosiskY0M/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737426847; c=relaxed/simple;
	bh=cqAMEbrdczsFCA316sPqjjyA7ALAFYrbbsbeMi6RWiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=YrhWt5gJqNbPlQlahq7f5YMuytACJou4bKFuDdOHflWl4CXLHsyd7yY1UIK0PIwf5+7MfJm+YYL0tzGEh+SwiKDbS6J8osivV2npoKNVf984SdohCcR4I6Vo0T/N1ieV1Fgg0x+Dxq3dS7Vl5Nc4Ek+cJCcjaWirUcdSiddbBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PyJFqlVJ; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PyJFqlVJ"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250121023402epoutp0145207c68a1b81041c6380afe0f45f4b5~clIIoEnQ22406424064epoutp01F
	for <linux-doc@vger.kernel.org>; Tue, 21 Jan 2025 02:34:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250121023402epoutp0145207c68a1b81041c6380afe0f45f4b5~clIIoEnQ22406424064epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737426843;
	bh=1Hkxk2m8dg0qUTbY9/1KkBqFD1L/vV8wRNYJej5g09o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PyJFqlVJuxyEBjO1V1eIaJ9Bee05vkby72rIs6WXO5NNX5ktQ0l4yM3y+x1h5Aozx
	 la75lJu6u5olCdNRnnSJXahsM4DQOQh+INMUVXyPvmELxEaXCu/2kCDCZUmuuV0HPm
	 iWmxPILVo+GEjTx3erTE2ChV+wxldU1QZGXUDt4s=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20250121023402epcas2p110c6f6d62cc8784723a26f66996daa5d~clIH5-SRd2425724257epcas2p1y;
	Tue, 21 Jan 2025 02:34:02 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.69]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YcWVd30hRz4x9Px; Tue, 21 Jan
	2025 02:34:01 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	8E.20.32010.9970F876; Tue, 21 Jan 2025 11:34:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250121023401epcas2p2a3d5086caafb9950070c258542dce27c~clIGxGb4V2385323853epcas2p2e;
	Tue, 21 Jan 2025 02:34:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250121023400epsmtrp2a5c4821979cf260c16e414579f55c206~clIGwOI1m1100611006epsmtrp20;
	Tue, 21 Jan 2025 02:34:00 +0000 (GMT)
X-AuditID: b6c32a4d-abdff70000007d0a-05-678f0799016a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D8.82.18729.8970F876; Tue, 21 Jan 2025 11:34:00 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250121023400epsmtip2ac6dca7106a25615294aa5d88c89fc78~clIGgFFNX1481014810epsmtip2E;
	Tue, 21 Jan 2025 02:34:00 +0000 (GMT)
Date: Tue, 21 Jan 2025 11:32:40 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Hyeonggon Yoo <hyeonggon.yoo@sk.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>, kernel_team@skhynix.com,
	"janghyuck.kim@samsung.com" <janghyuck.kim@samsung.com>, Andrew Morton
	<akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, Christoph
	Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes
	<rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka
	<vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
Message-ID: <20250121023240.GA645761@tiffany>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1495dc28-f16c-4990-ad89-2a90b79a80b8@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNJsWRmVeSWpSXmKPExsWy7bCmqe5M9v50g9M/RSwm9hhYzFm/hs3i
	+rc3jBZPDrQzWsxcm2SxsruZzWLznGKLw3NPslosbFvCYnF51xw2i3tr/rNatH3+BySWbGSy
	mLhG1GJ2Yx+jA7/Hzll32T0WbCr12LSqk81j06dJ7B5db68weZyY8ZvF48mV6UweCxumMnss
	7pvM6tG3ZRWjx7fbHh6LX3xg8jiz4Ai7x+dNcgF8Udk2GamJKalFCql5yfkpmXnptkrewfHO
	8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBfKSmUJeaUAoUCEouLlfTtbIryS0tSFTLyi0ts
	lVILUnIKzAv0ihNzi0vz0vXyUkusDA0MjEyBChOyM3btustUcF+yovffXPYGxuMiXYycHBIC
	JhK3Lq1m7WLk4hAS2MMo8WnhMWYI5xOjxNOFf9khnG+MErP3rGCFaXny/DEjRGIvo8SjSzeh
	qp4ySpy89pkNpIpFQFWiZe4GdhCbTUBd4sSWZYwgtoiAhsSPbydZQBqYBa6zSNw73AjWICzg
	KbHqPcgKDg5eAV2JWwucQMK8AoISJ2c+YQGxOQWsJJ53nQLbLCHwhUNizbsTUCe5SDT+ucYM
	YQtLvDq+hR3ClpL4/G4vG4RdLLFt8WEmiOYGRonNHfehGowlZj1rB7uOWSBT4sP7WUwgR0gI
	KEscucUCEeaT6DgMCguQMK9ER5sQRKeyxP5l81ggbEmJR2vboc7xkHg96wsLJFBWM0ncO/GS
	aQKj3Cwk/8xCsm0W0FhmAU2J9bv0IcLyEs1bZzNDhKUllv/jQFKxgJFtFaNUakFxbnpqslGB
	oW5eajk8xpPzczcxglO9lu8Oxtfr/+odYmTiYDzEKMHBrCTCK/qhJ12INyWxsiq1KD++qDQn
	tfgQoykwriYyS4km5wOzTV5JvKGJpYGJmZmhuZGpgbmSOG/1jpZ0IYH0xJLU7NTUgtQimD4m
	Dk6pBqZoxf18AccNmK7Y1zyL4bde1B8R8EiSq3uC2M7auz6ppgmu6pLfNC4zrjyyYbZO17b5
	ktL+xumdVk/vTo9hvOp6RjHjuYla7oISaRGJ/+t4QjXsbBdd+ufdbzqn8Z2+tIxcSdur5s5N
	XbtW3zmgPuX2VHad6hb71RuYV72zjv/e9Hcqt2r+t5RJYjJx19dGhIacn9TV47Viv6tClAvv
	3rn33TsP79heMeMed4tr3MotrrY9k9Ta/tntTzy7JrzupN/7wsZ1+6yWPbtxK2nBP/fdNn4r
	ZTqOtVROD223/MHpkny7+eKSijsbebbWJPSe2jbDUEDDR2vq9r0Tr+9Z1b2XIYh7w2/JW2/m
	Wk05+FuJpTgj0VCLuag4EQBM/aI6fgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOIsWRmVeSWpSXmKPExsWy7bCSvO4M9v50g9vXLCwm9hhYzFm/hs3i
	+rc3jBZPDrQzWsxcm2SxsruZzWLznGKLw3NPslosbFvCYnF51xw2i3tr/rNatH3+BySWbGSy
	mLhG1GJ2Yx+jA7/Hzll32T0WbCr12LSqk81j06dJ7B5db68weZyY8ZvF48mV6UweCxumMnss
	7pvM6tG3ZRWjx7fbHh6LX3xg8jiz4Ai7x+dNcgF8UVw2Kak5mWWpRfp2CVwZH2fMZyr4J1ax
	9X4zWwNjk1AXIyeHhICJxJPnjxlBbCGB3YwSC6ezQcQlJWZ9PskEYQtL3G85wtrFyAVU85hR
	YkN7N1gDi4CqRMvcDewgNpuAusSJLcvA4iICGhI/vp1kAWlgFrjLInH55FawImEBT4lV71cA
	TeLg4BXQlbi1wAli8WomiZWLSkFsXgFBiZMzn7CA2MxAM//Mu8QMUs4sIC2x/B8HRFheonnr
	bGYQm1PASuJ51ynGCYyCs5B0z0LSPQuhexaS7gWMLKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz
	0vWS83M3MYLjVktzB+P2VR/0DjEycTAeYpTgYFYS4RX90JMuxJuSWFmVWpQfX1Sak1p8iFGa
	g0VJnFf8RW+KkEB6YklqdmpqQWoRTJaJg1OqgencyRNJnWtuLjnPIXe3Mizr4OP2mYr7W0yZ
	V4kF7VzE+XnDzHWzVLP6NzcYyqXcNwjrnxB7TeGnwGH5+LiEz4t3dv+KWltaZMWwec2yh3cL
	Q9dmZB1an/xw6Zqtfb+LvaaEpG9m1Qm0mbqyVIlb8Yf0rkmTlz95rl34xmqbztmZu0o3HW6b
	s3xj+lEuxnPTL+c8r3+V7yg54cMS3bUpYaXXlAJTlcxWHc1uucFy770De16yCp9Hhbno9rpg
	O4d08yChGXuvPfbaGnX4joyqNecxo6Mnp575GiPl3Pt03+ftOZNY+lUrHhelz7h1rD7ku2XJ
	TE7OiZbPb2Vovev4tkLgp4J9/rQrj/xvX+PvDk9VYinOSDTUYi4qTgQAjFE16UoDAAA=
X-CMS-MailID: 20250121023401epcas2p2a3d5086caafb9950070c258542dce27c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----_tVqzgGyW6tMiW3Z4snM0QQCkibZmALk2DMBUp8NwEyQzDMD=_2a9654_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
	<20250120082908.4162780-1-hyesoo.yu@samsung.com>
	<CAB=+i9R-9LQWJFGSJJ5dUqwkoFQK8VDxEwi-4Sb73pTP+xw+wQ@mail.gmail.com>
	<20250121005452.GB610565@tiffany>
	<1495dc28-f16c-4990-ad89-2a90b79a80b8@sk.com>

------_tVqzgGyW6tMiW3Z4snM0QQCkibZmALk2DMBUp8NwEyQzDMD=_2a9654_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Tue, Jan 21, 2025 at 10:48:08AM +0900, Hyeonggon Yoo wrote:
> 
> 
> On 1/21/2025 9:54 AM, Hyesoo Yu wrote:
> > On Tue, Jan 21, 2025 at 12:41:01AM +0900, Hyeonggon Yoo wrote:
> > > On Mon, Jan 20, 2025 at 5:30 PM Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
> > > > 
> > > > If a slab object is corrupted or an error occurs in its internal
> > > > value, continuing after restoration may cause other side effects.
> > > > At this point, it is difficult to debug because the problem occurred
> > > > in the past. A flag has been added that can cause a panic when there
> > > > is a problem with the object.
> > > 
> > > Hi Hyesoo,
> > > 
> > > I'm concerned about this because it goes against the effort to avoid
> > > introducing new BUG() calls [1].
> > > 
> > > And I think it would be more appropriate to use existing panic_on_warn
> > > functionality [2] which causes
> > > a panic on WARN(), rather than introducing a SLUB-specific knob to do
> > > the same thing.
> > > 
> > > However SLUB does not call WARN() and uses pr_err() instead when
> > > reporting an error.
> > > Vlastimil and I talked about changing it to use WARN() a while ago
> > > [3], but neither of us
> > > have done that yet.
> > > 
> > > Probably you may want to look at it, as it also aligns with your purpose?
> > > FYI, if you would like to work on it, please make sure that it WARN()
> > > is suppressed during kunit test.
> > > 
> > > [1] https://docs.kernel.org/process/deprecated.html#bug-and-bug-on
> > > [2] https://www.kernel.org/doc/html/v6.9/admin-guide/sysctl/kernel.html#panic-on-warn
> > > [3] https://lore.kernel.org/linux-mm/d4219cd9-32d3-4697-93b9-6a44bf77d50c@suse.cz
> > > 
> > > Best,
> > > Hyeonggon
> > 
> > Thanks for response.
> > 
> > Using warn() instead of panic, is a great idea.
> > Thanks for pointing out what I missed.
> 
> Just for clarification, I think changing the common error reporting
> logic (like, slab_bug()) to use WARN() will be preferable to inserting
> new WARN()s at random points, which is what this patch does now.
> 
> Best,
> Hyeonggon
> 

Thanks you for clarification.

Actually, I considered adding BUG_ON() to slab_bug. However if we add BUG_ON() to slab_bug,
it will prevent many meaningful error log from being printed subsequently.
As you know, slab_bug is the log that usually is printed at the biginning of a bug
in the slab. As a result, it would be difficult to figure out the problems based on
the logs during our large-scale test-bed.

Similary, even if I use WARN() in slab_bug, we won't be able to obtain the logs
when panic_on_warn is enabled. I don't think it is useful to include WARN in slab_bug.

Instead, I will implement a solution where WARN is only used in slab_fix before
slab object is restored. If I add it to slab_fix, I think warning is suppressed on
kunit test by slab_add_kunit_errors handling.

Thanks,
Regards.

------_tVqzgGyW6tMiW3Z4snM0QQCkibZmALk2DMBUp8NwEyQzDMD=_2a9654_
Content-Type: text/plain; charset="utf-8"


------_tVqzgGyW6tMiW3Z4snM0QQCkibZmALk2DMBUp8NwEyQzDMD=_2a9654_--
