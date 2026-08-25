Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AFF484256
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 15:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671585; cv=pass; b=n6A4NEsASh8PdWJUx4BKOwEhtY48/8ZG91AjJnviqbZ/Eh94ctPS9ui9s0s0mBtyge54i3lQFSg2FtqJc3T7bBMZxsQu/oe+zgkezUK2UanykbbGTr1VSWgTs2iF1mdjlH/Kex6PxCym792eMF65yxjNc1phEFSUU0McxZS3zlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671585; c=relaxed/simple;
	bh=jTDw6n4/zXg1Lvjc9R5Av+cOtOkWj0zyRcHd9mGrOxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mvKvgL7C8ezIEZB7MaqlpdUldzIETsaBnjSPJcNo1DXBeRLAdZ5xYnFDYoBBPH2KRSwfq0IB4uwM1IXMCsNsMkhbUN6Ft9Fql9w0GPHQv37ud6b3LrCeMB7AQEdRe45gWIsQCbMM1XwUjCp+bLldK6MzY5JnsVzO8BemQ0RTx+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqTAPCjC; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqTAPCjC"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93695893ac1so298493085a.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 08:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787671583; cv=none;
        d=google.com; s=arc-20260327;
        b=W8f4SJKn21f4k11TXRD+FKGD5bgBfhuT6bchMeQnjxVFfFLTKoJWIW8uxY/aWP07JT
         cG6gRc89z4bMeWPCxYLtaq9fWJKyDWjeRLiof8OuB8kYSQvVTR27COHEWNzRqBTVchb0
         62/YIf5W26R4FrPpT2+kJwpEWE0walu7DN801OzKQSWDGyZyfw3x2m/Pm/ZSC4KkHVC8
         zcnEc7KoS1aJCNTAn8lnHdmY2f43CZ6yzVicTmpQlz6GtilV+utfp/hO2fVKo6Cz1du4
         yXkQgZUZM6JhO2kbYxBgohahBF+ieM0+6Ls8n0idDK64wi5Je3IifUCoxqQxTPlWb6bR
         XR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jTDw6n4/zXg1Lvjc9R5Av+cOtOkWj0zyRcHd9mGrOxA=;
        fh=7UO4xI83uXiWK1idAa3ZXnnVQgfCbCiSV71lv8gZHDc=;
        b=HYiWOWOs00NFgxWG0PlG5FQ9gdx63ckWi/iW1ebKXBOBn2mxC4c3KN16XBlsN3VSgR
         aBV4+p3MxukRrToLO3nJlwt+zha0UlEGInvw5Imr3LXbHhUWELMOiAu8QK7jpTIGvy2S
         OXnb0IK0S0ZaczqxXLOGHJ7cDmGnqWeCclLX5IjbWVSrjg+fyCg6+kXXXLdV+e0GhTsr
         MXmPV/QHbSPJwR2bR8FGehp8qJVcJLLoKGi2WdtQbeC5BunHeYbTUkHsF824D95Bh1Vv
         s/wSIuLaOYpsXVlwfirPr+DKf14cTG5ke9Vhjj9GoGuoKwAswDd6tBk22CH+levdDmle
         vJSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787671583; x=1788276383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jTDw6n4/zXg1Lvjc9R5Av+cOtOkWj0zyRcHd9mGrOxA=;
        b=aqTAPCjCEihfORXyKHYOELJcBU2Kb8LxpPfX6t4nt1NzmJH5tq02Eb0iRK4A9fmrmR
         hTS9T72hESxRNpo4oU88cruI9KuA8iGUyuNCgdMTMrUjh8WGnd0I5jaGYsetUZC+ubpD
         R9N9/as/3yCZx9aRvqpLXLNmXmrv+aRasRUFcklSf4wjHW2AefIqb8PN3GwLrHmNQJNO
         5/GGLqJ2GRoqHmftDBgUaEHet2WkwK2LN4bFN0POV48SkvopoD4H2ZIRmvUjrjkVXaeU
         PcEpLNyzR2eWI/WSqSuK97MHGtqlhnVsR08Abfkg3dTaCKgojioe0HKRLx8hvHt40XNy
         D8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787671583; x=1788276383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTDw6n4/zXg1Lvjc9R5Av+cOtOkWj0zyRcHd9mGrOxA=;
        b=H2PuksMAFJwvAEQKZmCDEwIhqcRUpPcOpGIM9Nyx7pX7gotZ+MG4xPfrUaJRXa2Ehk
         Q4IGdZhKbvRS8DmCday6TERBSTzoxtdhQ7LcUdOOAJK3V0HoK3Apm4kR8gHtPIDFnUl4
         hoFr2GC/5RzPHnZsoR9FMGS6yA6Cd2K5vKMHCd5KdHCDaWYyA54LakmLI6Tzslmfl/b7
         IzpTuJ2DcmJsi5PlFAGpGSEiPM0YP/jcUucZJiocs56T7Mgn/4XGCD5TbzijxYQ8QEnw
         1DIJiSLqnmOrNa9GJKwgh9j7IS0E+JuGQQYkX+qBhz1bHVdI3drmC/GQt62kMdDQ8pvN
         roWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKMVGnBQFhMr2qNK4CBlwPNbtXey4NetYCEZqIaamngKryiGBEj6mFMskBQ5KNNZf120uKiY55kaY=@vger.kernel.org
X-Gm-Message-State: AFuF++mx7C4raDWsiw8AMrLgUtzrj6o8I6p8wsviNpxZIouHG/V0pV6w
	rSRc1HuE0oDoNojiDYy32EdrA25DljRnlhK/nd9i8s12xHe88vucsT8S2aj56j6tnt6JGuPM0Zv
	qBcRl0GEwivsDBQk3SqIYHSXjA4tzuX8=
X-Gm-Gg: AR+sD100WqNAbueRQDt+JH70daQYlPH1GKlOwJ6wRnTnVqn1o/CGa7hQsUhhignnahu
	Ei5NsPmxbi4eI5ZDtXAo3RBkmXgKLYU6gpKKr4nL2v71AHKXYa33yrn5AWdUd9vRmlOvYdcxGqJ
	gMK+Vz4ilTfDbGHSTgmAAWvCJN/mZwZQ/aWvDV+LFWQ7fYdoRaOuHYSGTY+fN/7hzirMxVmj7py
	wSb3IMZ+gsjyT0imYOY2Jv7T5kAc9UkSShSueaAXxds6Va/oVoxpCDYY2wFCRQMRkaqiYNRhNIk
	umcXsHmUcOUoRzUSgZouGYhpRCcJifYNdROPRUIWGme3HeaEPrQc0AMsivJra+oiXv7BLxAftJf
	LngHfNTMJnkvC1eZZGJabnyKJZcl/8s4ZoYnK04bCNwWRhpLHjDvcMqzRVg==
X-Received: by 2002:a05:620a:1a1d:b0:937:6771:e7e7 with SMTP id
 af79cd13be357-9376771e8damr1069880485a.30.1787671583123; Tue, 25 Aug 2026
 08:26:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825144525.12670-1-silvapfabio@gmail.com>
In-Reply-To: <20260825144525.12670-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 25 Aug 2026 12:26:11 -0300
X-Gm-Features: AcwNN1WgVZ6g0fFQ6kFeBGosaaAhFvO6L5yVtLZc-37k8t6b0AXFf7yNGyPGwR0
Message-ID: <CAMAsx6cPZ1f5XV1+CRoAJj1mAe--5wcekOWwqCyEW+HioFfuig@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate CVE documentation
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 25 de ago. de 2026 =C3=A0s 11:45, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
> Translate Documentation/process/cve.rst into Brazilian Portuguese and
> link it from the pt_BR documentation index.
>

Hello Fabio, why did you translate this document, given that a few
weeks ago you sent the same patch and it had already been applied by
Corbet?
