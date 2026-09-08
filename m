Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25FB49890A
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 21:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903659; cv=pass; b=qnIWS9Usrj4ff068jIHYIkUZWFtoTq1i+23uZtM/aBc8ShUZi8htujHJphvaWILXKuqQL1USR74Dj7MEDrqO09O1uIU3rtVNk1v1z7rfSVFk926shxu+uQ1I1i5BJM29nRSH0VIUVfEO3HRGEUn8uVqJB6ouNrrDFrjb5RBBBsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903659; c=relaxed/simple;
	bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpI+l6wilEJYqp8W+2+1f9dunf6bGoCjk5j1Zmx01y0rBE60n9+lglkE93PnxyBibUt2w/0XhwFHulu0fuJpnOnD+b7AxYmbhRWRKey4OUupjaxBpeoNWNV5RtthOpSSl8Dh6Lupljwa1t7rEpybXHph+gLsSwBJFTTdkzNUR+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnGCa6sr; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnGCa6sr"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0d3105cso586623e87.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 14:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903655; cv=none;
        d=google.com; s=arc-20260327;
        b=PJqO8VwcjAn7Q3aNSsBz1s/dK516ujskf8JaSgbeljv0Ev03W5mOOsvk5cgCplwOdk
         d8NW1kMbnFOebt2b4/dxMYWOjQTkB5lC7ayfulST0SubzVLBJMPj+NQXs9yja/VjEd+5
         h24pprAo+VR4pvtTMgJEwJRpog4VARj+rojpP0nmAZ7G9BB3F8EQya1IqwAc/yNwmUVd
         2HRrHcUnOW0XtbEpQ5epyoEPm+tvgoGYaKeEUgTUZ+y38vwZAaeRWMsgV7bXi46LFVKp
         Lwe/KMclmr//l3fXIfORFoGNP9+8ZdwXsWaynpbA69WMQNNDd1JNGhZffNLt2QFSFnS4
         m+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
        fh=itVn3qX9S29qBo5DqKyqL3Y0S/kQnDBVc3F5brkKMXE=;
        b=JLLMAqu+93DF2j4O93q4l8iMSAuITNl1dCydOOmSc3uPqL7CHgxi5MWRbYP8iLZ6PT
         0EiKhNr4XAqCi6RiqoQB8tnNsof6JuukuG/n5kT5YZWsH3wTBPqZZdeCJTM4br/RJ6yK
         qgF6GvSsIQDTgCtZonqHIxKrxM72d7Kcgz2vWZaS2vNofl8bGWptcqa5xr1kPYJ3hPBB
         YVh4xNT0/p6gFzF1L0Cb67c70DOPP7xBiuUKApeFIVDo5DXWqao8lqTJY+ZR8ziTPhBb
         pm8mK4mkUrE9FtbNxKa/Ggq5Y2ZaPCDbt1ZB3xXD5FkdftNGWpPA51+vUUMp9i1kppPP
         ljJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903655; x=1789508455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
        b=nnGCa6srOuNnqz/8OWsvPLxDj79g4A4Evr4cokx8951gQr35qICBzQOIahm5/UF3Vh
         M6qbNGfXQxpF5oDBcUiugCFWErOjsqK1uQ6zm9dv5hFK22kBPBS2uX6gV8GQTwsXl0y1
         56on8O9+HWBgkNt83neA6iBHfzhE8hPcG4rd9u/UdsBOcqX2MgfwdMDUy2MdEE3WRwiI
         3aQu6I+H+jQZhN9KCupEmYQkxexjjwO67kRpBq4myZP4z8aEZDxLXsrWD+vaQiFGfRRq
         A0I0tSO6Ck7OEzVCL+QRbFZH3g24tb3fyYPipEssYAfTKmB4nkHD/m/2R6SncrvWM0mq
         wxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903655; x=1789508455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s8/iqyVEMrqda2nfwXPpJ2kyzj5MWxyHQckmZinACOw=;
        b=ZFsveX2AOLJnUky9eWIeonKlkBbj3syRmcKy+H9/g5gf++Ecf0CQheQORzJoRAm3JV
         9J2n6xJSsVgotCdvYvBYJHzUfF2jp3BqQt46i6jVYkj6cROptRp1XJwiZ6tZh3eKRTr7
         gnxKsnb1ZQic736uRjxJhgyU3MslE2QTOhSzUqM0HCAKgE3LHu6ZH/8oIRvMD0ljgd3S
         AVB/8HOUDQLKLrHr1kWPbp8tshsz9ykgMXB1ySs2GJeQflrUF/Lki33+YQKhugFdS6dH
         FQtB7v7y8+pTPUNpL1yfnvGdk1VPe2nTPyDHlqqVg3h8FIlPrIOV6xnFCdvnQjDPkLXm
         fI0g==
X-Forwarded-Encrypted: i=1; AKwUvBy5Q03r6W3FDRkg4rqG2cAT/xXMw06sLkSr04ac31ER1BE1yQUy5NSfG8xWukhvrGnVbDpr2UEeeyg=@vger.kernel.org
X-Gm-Message-State: AFuF++mayj5Z2aikrV/x4yuYOPO8nT8IjkUulWz+6pNAUowpTM8bBEdq
	k+0xOgQPdDnJ/aQpryy2Vv/rXztCH/TSo9VTdEG8/ImuW/LihWsguyNbAi/RdtYwp475gkPFsXo
	SCRFDcjSov0zMOuA1FNFNHU6yZ1XDMlE=
X-Gm-Gg: AYBFou1mbdM0DiIQ6Yu5a52mcptLfSfurb6TQFr+2w2mySqxg75JF6Ons3ygDQszbD2
	AnWCzgVe08Gc13BfxTXtkgsrIRzLIGhwDOPCqZy3asE8gj5bgspjYkhwURiKcmlgmz+J229CbVH
	5dCdCvlGlXs9THd2JaWwUH+wUGOpRUKAQAUPwPE+d4p5SNB4+0QTCvG7exCp4qF2x/1u6sR9FMb
	ThRhRUlTA26OjTlGq/yFj1akDUXf2VlHgUatY8e37XQsAOrtCJri+JPbxQQLP6qKfuYqdEFFZaW
	xn0aKNsRHKtM3jIvor7oxvRri+QSiJIxUpzHskUcu4hjes3lnq2d/9WkN++OYiywrbaQx/Xn0lN
	zq3kuaXlVJxUQTvttsu2b21y21l4=
X-Received: by 2002:a05:6512:1348:b0:5b7:518c:4fcb with SMTP id
 2adb3069b0e04-5b7518c518emr3120909e87.6.1788903655259; Tue, 08 Sep 2026
 14:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKspUhJAbCWoxgh2eq8R5g_MiNK=oXgKPUWqGOpHh0w1-Fv74A@mail.gmail.com>
 <ap5xEtMdwXS8Pvcf@wyuan.org>
In-Reply-To: <ap5xEtMdwXS8Pvcf@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Wed, 9 Sep 2026 05:40:44 +0800
X-Gm-Features: AcwNN1WOdxDTSZnALkJ0_OE_heepkh6O2vUX_lfRBKLZK2OROuY6I7wC2p3EoNc
Message-ID: <CAKspUh+=T_v1HpwRkA7OY1m8aU-kZgMviHxDrYpBe__8YYHQhg@mail.gmail.com>
Subject: Re: Subject: [RFC] docs/zh_TW: defining a maintainable scope for the
 Traditional Chinese translation
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Yanteng Si <si.yanteng@linux.dev>, Hu Haowen <srcres258@furdevs.cn>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If the current translation quality is acceptable and it's not
> troublesome to move it, I think we can just move it. On the contrary,
> if the translation is significantly behind, there is no need to go
> through all the trouble, just delete them.

I understand the appeal, and for some files I think you are right. But
I would like to separate two things that are getting mixed together:
relocating a file is cheap and mechanical, while deciding to delete one
is neither, and the two do not have to be decided at the same time.

The four relocations in section 2 are the cheap case: the files are
reachable, they are not the worst offenders, and moving them is a
rename plus an :Original: fix. I would rather just do that and revisit
their content later.

For deletion, my hesitation is that it is the one decision here we
cannot walk back. Marking a file unmaintained can be undone the moment
someone turns up to look after it; deleting it means the next person
starts from nothing. Right now zh_TW has one native speaker, so
"re-translate instead" is only more efficient if the re-translation
actually happens.

So I would suggest: deletion by exception rather than by rule. Rather
than "significantly behind means delete", we name the specific files we
think are beyond saving and say why. If you would like to propose a
list, I am happy to look at each one -- I suspect we would agree on
more of them than this exchange makes it sound.

> Tricky?

The six worst are mostly two clusters: admin-guide/mm/damon (5 files,
55 commits between them) and arch/arm64. Those are exactly the files I
would expect a Taiwanese reader to skip in favour of the English, so
they are strong candidates for whatever we decide "unmaintained" means
-- and, if you want to make the case, for deletion.

> However, the former might be clearer and more understandable for the
> readers.

Agreed, the notice belongs in the file. I will do it that way.

> And after process/, I'd like to do that part "Working with the
> development community".

Good -- that is the section of the index that matters most after
process/ itself.

Dongliang: Weijie quoted you above on re-translation being more
efficient. That was in a different context, so I would rather not
assume it carries over -- what is your view on delete-versus-mark for
the files outside process/?

Thanks,
Chen-Yu Yeh
