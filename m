Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A1C314D35
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018690; cv=pass; b=sea9GZ+cpR5x5sV+fTtZfVNTfrlAP0iJbzNabqmbsMuSXi/JJV3BjH8FL1eyWijyxcunbvpPdKGsq2LI30ZM7UpLVTu94eXB0svYj6Wap+HweGSA6OW4PkGGQv3PXi7dt3On2RB0zY7+ZycmcfLY0cuk6KSQnm2/F8+Ny1dG7io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018690; c=relaxed/simple;
	bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUGLevtudSITYFcPsj8ps+Ozco+F2k5nIoVVVfafXyy5cLj0pwLPe0iKlr7f8KtFTAPlZ1qI+Ib+lY1pMwlidD42kXHqgip+eXVQowITPDapeeNQ5M+1G0RFdTVB9+H8uyR7H6Chq2zuClIYdRt2Y0UpJhjcyNAorIpIZM51jFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdGQ+rOk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFE09HNo; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdGQ+rOk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFE09HNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777018687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
	b=KdGQ+rOksMmtNSNpYp7CmknQkKu04JQoI2Szr5eK0qd/KR5uV3VyK9iHh8JC3BKLQll1FE
	0Zn8cyypmqzphga1c/ivjXe9nqDjDKH1VGOHQeSOrWlhGcEDfipOcJZlLkgPWiaCL3iAFf
	m06ieyw1d36sZ/X4AoO7R/a6JtHp1ME=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-0QMPFLSCMfezd3B_XQ5rJw-1; Fri, 24 Apr 2026 04:18:06 -0400
X-MC-Unique: 0QMPFLSCMfezd3B_XQ5rJw-1
X-Mimecast-MFC-AGG-ID: 0QMPFLSCMfezd3B_XQ5rJw_1777018685
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7a1f794a45fso166913327b3.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 01:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018685; cv=none;
        d=google.com; s=arc-20240605;
        b=abEjqDEqzYxcBfLg/AVDcLcRn1tmqqhUaJ0Kq7TtsAmslY9MUa0GkUIE9nIrev6pKK
         wmJz50l6w8dWcX0uY7RxfTT4qsJ87x+42VZC7d1OnrSpTrzhZasuE+93yuI4+yuFLHIL
         OMHe6WWJzkDMbzAiIptGRNgn0fUQLIzRPdk3eXsgE05xjUCfPTT2FZppVioiSJk9bw/G
         zDo6fEICB6tB93SjZAxwlndIwmbeSs/l9zRTYJ+iT4Y5XfRGlPU46fpuHh/hyCMSLtbD
         +RMLrODs51eqA8Z16OhNMs8wPrPgr0r1LU+MnUPeD3hsrz4Ja6KwW8R3DCLEUJAR9qDM
         jU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        fh=6OwQWHuzAN0cuodQpVRR1vOanv+l2CDfaJFRD07jEpU=;
        b=jTKvbCi7LtgliIEtA95KWcc1jZnTScUEN2Vke+bT+cfN4d0k2mAO84GVxhc2bzFvEw
         +oC7738PwCYqJSPZ/qkIP4m3ouYzWpte7b8Tp4H3kB2Poctrbhz5wcKWpmQHPsFBTInW
         kG0Ex29IDu7NU3ttIPbhgR+mGk373CT8QUkr8VDH8LqSSlaht+C80c0WQ5W7fXwuegXq
         0/UhZk56sY76eyB8mXvSas644Ao6BThJ4WEmSLAs9+KG2fJ/qvOBxfMgEjI8CUCI5qhU
         zc+VdaBIHJONsJsY5yu7qW8nEuyNSxPaUZ91tGbSegAoTBxAUufwXhBJoSK9+ssrg7tK
         b/fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777018685; x=1777623485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        b=UFE09HNo4IGvA8BUZdlOUfb5zSlXe1AzSU3lpqk9eEWyX/ESq1QT64fOcmWUKlybCd
         sk5NholQlm5fwRG/RzNqL0i8tdBdEIDic3/1WfOqSGgmMTEWxaSwoUc/TjJj5Gigrl86
         fib5FKeNBDtEAEAdonFGPNDj2pxqVdFzZ0LI1RKkE0terFZzTLOHiWXVYo4y93Qmlpzn
         LPt9zxwWmz41MWYORXZmQZivzcPzn2Ti7pAmcudKpl0UzOZhuF8DLgB+CBFciUl7jeFi
         5MxiLj4PoNvKquSqbkIAxeMLTtrNAXtDvxXjLrhXdkL9B4qPdWGsemdSOD1rsyYqEdgY
         FRHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018685; x=1777623485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shpYQ9KZLbr6N3HVlTPITJ076laxtxRBnaiK8rmbhhQ=;
        b=OpojpEGwIkbIjwzZXZFAL36sscvrnKBXLAJWTQR4XnZpciTqsXSQrBN6RjENroZgl6
         eu+HRcvWYJfN+m/p8QF7rNWAIYgs/rfN789BXVKFO+xPGsWIp+MuHNYLmbFwhJuP08kX
         PnINrvEVlr3YRvlHrFSdJvynOWeRJRc9xHWFTYXj98IWWrexgig9lUCPrFoKyHLOnKZj
         a7A5gGrJAHKOkVZBTG1O1GNbT/9C42gZ13J12kShs/LgZiZfWR5KxvhlQt3Wkw5hKyGG
         zERtD0JcUwFe/bC923LH81IOy4cGkFuEUsY3NNzZxdGygMeaIUdZLvlxhbk154CkYgUk
         KfJA==
X-Forwarded-Encrypted: i=1; AFNElJ+PgkVCeiFyctdzcGJe8oAXu5WuX3dvyylwYzZD+BOlZ5UYzIMGTUx1g2smx4GLJx3KsxrMr6Eo5Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXHUiWhJHehEnYOY90cdDWavapSnur2T100dRNPnBA3JwN0oA
	Qh6YLZCm3J1ModVUh7euKp9fr1iuMG0VlrYdEywGTd/TGPYOwnx68BeO2MmrlzQWejSzbMdukP/
	50xlwMLvQeUryQhDbV70B/JZ0/+t4s7D/BV0lDkcAKgqIDeiYhOfGrCHjRTNb5W7xggRJE6SAdG
	JfilMDRuz8EIJ7pt75DAowBnVJLth77F5GcwQj
X-Gm-Gg: AeBDievpBn8uWz0gPU19K4iKSpxzAaLoQ3NwSzG81jYtRT1pBlrj8rPZp9BJCT5iZKQ
	LIpvJVr37rAK9yQgftN52PpCelc9BrJ1OZ+CvQAb3DABbBOwvgjsDsdkUW6p2/OukHCGYvlG5Pu
	0exH2uHWqFXWTCUKXbZ3MIpj6HSd+YT1ySh8Ad5TkzwM634Vt3qsJ4eZfxoktxZT1OTydYBtWIh
	AOnrVpr21HRsVeQ
X-Received: by 2002:a05:690c:d95:b0:79e:8299:751d with SMTP id 00721157ae682-7b9ecebaa2dmr304557007b3.11.1777018684923;
        Fri, 24 Apr 2026 01:18:04 -0700 (PDT)
X-Received: by 2002:a05:690c:d95:b0:79e:8299:751d with SMTP id
 00721157ae682-7b9ecebaa2dmr304556787b3.11.1777018684469; Fri, 24 Apr 2026
 01:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-2-e8bc6e0f70de@redhat.com> <a1ddabac-8e50-4730-b936-4ddef949487e@davidgow.net>
In-Reply-To: <a1ddabac-8e50-4730-b936-4ddef949487e@davidgow.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 10:17:53 +0200
X-Gm-Features: AQROBzCPgKA61g5jTjlSE5A3sG-gDo7X0r4wi6SlVdjlUQQBr3gtOcBVPcG2A_U
Message-ID: <CADSE00La5sN18OqEmSE7NHwHnS02k5C1Gn2+o9hy4S4zLgC7dg@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] bug/kunit: Reduce runtime impact of warning
 backtrace suppression
To: David Gow <david@davidgow.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, peterz@infradead.org, 
	Alessandro Carminati <acarmina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:21=E2=80=AFPM David Gow <david@davidgow.net> wrot=
e:
>
> Le 20/04/2026 =C3=A0 8:28 PM, Albert Esteve a =C3=A9crit :
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > KUnit support is not consistently present across distributions, some
> > include it in their stock kernels, while others do not.
> > While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
> > features, the fact that some distros ship with KUnit enabled means it's
> > important to minimize the runtime impact of this patch.
> >
> > To that end, this patch adds an atomic counter that tracks the number
> > of active suppressions. __kunit_is_suppressed_warning() checks this
> > counter first and returns immediately when no suppressions are active,
> > avoiding RCU-protected list traversal in the common case.
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> I'm not sure how much of an improvement this is.
>
> It might be worth putting things behind the kunit_running static branch.
>
> You could even add a new kunit_has_suppressed_warnings static branch,
> though I doubt anyone's too worried about the runtime performance of
> WARN() during testing, but with no suppressions, so it's likely not
> worth it.
>
> Have a look at, e.g., kunit_fail_current_test() in
> include/kunit/test-bug.h, which uses the existing hooks implementation
> and static branch to reduce the overhead as much as I'd expect we need.
> That'd also potentially let you move the backtrace suppression code into
> the kunit.ko module, so you're not even paying more than ~a pointer's
> worth of memory if no tests are even loaded.

Agreed. This patch can be removed entirely once I integrate it into
the hooks infrastructure as discussed. The kunit_running static branch
is indeed a better fast-path than the counter, and leverages existing
architecture.

>
> Cheers,
> -- David
>

