Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C5E33120E
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 07:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852973; cv=pass; b=CNL9DD9QYevP1ZW8cwtalRQOxDQpNvCXQ5JieZXtxfDqBMtCi40wKq4j3ZOvV0YyNZr8XvPIHU+5FF9aLgYfFI4j/SkH5V1vM42r4pyGOi97kmInu/N9QUt/OmPqlQd6s/HNaQT2RT1AB3bcwBQOodWoqk0wSG/tqngDLgS35d0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852973; c=relaxed/simple;
	bh=TXP8H2J1oJEnyX14qzcCtqrehHnVK+c0H/VLlSeJFyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XeOAqm2yPXg4Gwz7G1eIQopfXjD0CVIhXo/Th5FarPhpwZhi6xmjXS700Ovs5y8yR02e0jg+H7qd+v4MX2BpXZ6KDdnriLo46ZPnf4UAHqyk2UdlhFCZUD/obqjwil7i1MLTVokLybnCtOGoGBqnKGCMnDXlt7fmN/xvQFlSl+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=APMIMY56; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="APMIMY56"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so3845786e87.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 00:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852969; cv=none;
        d=google.com; s=arc-20260327;
        b=fOxudYFgpFrEpH2EPT+V9OYEVll41sS97t99uxX4BRiQ7sQBVPP02Ia0+4zvx6WOxh
         SPYOzPmAWW05lt77jeyS2HgEegOpsNA7GiOY4wrySPW7EEZznp8ioVi5/v/SleQG2KG5
         b3eFoVozagRLxLj6pbrspUAOjofSt70eUzHvQdoshwg8s9ua0qDjnjFAglQPbMt3wzWI
         lDeE1nZJmP8WzjBwA9tRLD9ei+Cd/OmiJxRkytgl03Xp5HtL+/FbeNxO4OiC2xzfPv3T
         ay7rSkRTbCa59oQOgWfdIG/lvrt3UDT+iwMfcDK/bpzxJ0pTyCZ/IbNFoakgFrGvwkq9
         3u+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F1v6XQ7TbQj4QNfNrTJXkLDmDiu9hFvm+f9X7FTcy3k=;
        fh=vzBwO39dVs5tHVOW3AhohPbGgD5/gQp2cOktraHyD+Y=;
        b=QSBuRDxkMK2Urur7ndCeBzGrRz+kKrQCYyJd18Yt7zXTYmVfCt7cDDCGMFqg4uVAZ2
         J8fvU5/2Wtj3z4lILHRQSzhMRoZWlmbW7Btk0IT+bIiwxeWmNyLspf9qLjpeTy+o044R
         nd7WsYJ07YTois5ElTygwseLtcOORg+yu1u0k7QIDouFiUgAE3lr3lDkWAqxCHqvIyud
         +DcELcCyodqoRLUy8SkjEwQGQBIW50o5/1Jyxg9Xleh49LwaAmO2dRhVGrBlSW0Pgm1N
         pri3wbez4mrCIh05CO1N1kL4Co09xVXU/X4WwM7CUVPuygGa8mUC3kecUPvfqBRY53wV
         cAdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788852969; x=1789457769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F1v6XQ7TbQj4QNfNrTJXkLDmDiu9hFvm+f9X7FTcy3k=;
        b=APMIMY56LA3spLNYenIqbmylPYA+zKFNK8tiqYin+a64sOJiLtoZuAWhrMA2sJqAwI
         6NAU46LNsfws9z5LgBy9UrLeeKowoKwHPP4cBs6scqrKnF4BX+cS/UR4PzgLCl4xzpJC
         tqVJ5Az4MN0RPBN6hNlLzj+7vd4fNp3KToNMck67eAmi4odebVmjpzPzL+HiOs4MMkwA
         rkZiJ74+EK5u1cg0gdAZl7X2J45Qy4FCnay8tudOC8j7yMfGUPTOCN7MiKumXCRpuxa/
         qSTCREUi17lPn3GRkgrqNhR1xCl0tqKdarBhQREZzHEkALNNXwr4BPxZZTpsjpEIT3kc
         lMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852969; x=1789457769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1v6XQ7TbQj4QNfNrTJXkLDmDiu9hFvm+f9X7FTcy3k=;
        b=NjyIhMoSLdpm/4UpDJsksICCpzRb48h8El015FDIxyyQoB7hXaUEXgf5eNws5JU/uZ
         ttmPAgsnj0N5h8fNWznCIMdVKPMFZ3eJxWlRiUwXAFbFrB47B7Z3XVuMsGYdHsn0gRIc
         ljIMbpcpy5PhN7Fa70aMjX2t5ZSJYPb+fsviKbT1YWuRw5oDRK93VOevrfHqmUg9sheq
         /3hz/hYPbEhHKlMsBS6KY44laA3aiKcFKMYFyt1mQpxlnQrGRtdn1Vn/soP0hJsiCwLF
         dUOGpDLNh4I/X+MHHyN1KLjt0CooVm8MCI/SQ0iCWx/TPexx8zwhP5wtHsa3MNdaqbAI
         uuew==
X-Forwarded-Encrypted: i=1; AKwUvBzklRFO7x+A9lXbYRPYVyYkSUF8kL4sLpqh8gx9MqMjKKo5D7nCW3HRpkPl03VpIZeRQjYrJIOcujY=@vger.kernel.org
X-Gm-Message-State: AFuF++k5mivYDbykfbkHCuVjnDrk8xCSd1RF5juvl3VLx1vHOhvQ9EBR
	hX5S7IOvw/YEysIhqt+SOmp+lQ038/d0bNWmpgvs1SOPLCXe1Zr3LuN5wdj+8vWDhW2GhQwQ8/D
	i8zrjgLvmzz3dXnsk1N4Eop/vVusyLnnPvS8KU2LwCaI9GBlCCUTI+hc=
X-Gm-Gg: AYBFou3WSW7PhEE8j6qOPeUXWdZIDMnqdaXlv+llknCj8a13G3KxVW+rdIGjuHIgnvC
	S2kvi9NSgAGyuXim8S3dGsDEmDB63V9lf4q/8P3DZPn9mhPpe+RfuUCpRsTsuCJdQX/j8RymOVu
	l3lKe3uR72Q3S0eXZo9MycsAjPo/2btryGm7y/J01WPtkkPq+fJcTQJjn39KNvbTao1UDXnQMH8
	l5+/lFNojVbT6dCZQWWZ/LmDDBMWAjl7u5a+v5tvvLiyFwrAn82UptMjSLRGapEkic8vfkt1TeI
	pw8ACaweqJ96WAUeZy/fJwz1akQfXCEdOrj/I4+RPWx3LsbOoS4o0cr7ehJGfxMjJ+w4hTrQH3l
	1st2IsCYIiX5E
X-Received: by 2002:ac2:5684:0:b0:5b6:4ae:5b80 with SMTP id
 2adb3069b0e04-5b617081f7amr4126010e87.30.1788852969626; Tue, 08 Sep 2026
 00:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902092434.85096-1-marco.crivellari@suse.com> <878q5dovqc.fsf@trenco.lwn.net>
In-Reply-To: <878q5dovqc.fsf@trenco.lwn.net>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 8 Sep 2026 09:35:57 +0200
X-Gm-Features: AcwNN1X0tgHVErGnWNTAtj-AwHFXSO2JZlSTWOTODULdjQcefAhwNCFCUN_CUiU
Message-ID: <CAAofZF6rNRbapgEUokgj1x=Q2AKb1XqMYv-9vXvELmHPHn58zg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] doc: Rename dynticks-testing to cpunoise
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 6:46=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:
> [...]
> > Marco Crivellari (2):
> >   doc: Change dynticks-testing repository name
> >   Documentation/no_hz: Change dynticks-testing repository name
> >
> >  Documentation/admin-guide/cpu-isolation.rst | 4 ++--
> >  Documentation/timers/no_hz.rst              | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
>
> Applied, thanks.

Many thanks!

--=20

Marco Crivellari

SUSE Labs
