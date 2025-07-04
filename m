Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFFB225762
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 21:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751664466; cv=none; b=AMJSKYgVnwHJm6QAXKFMhzjH28hKND4XsEnx+nNDRya4HRZ/yWOwIQ0qYg1BmjKy/8u7zOEdHxs4VVrCEO+gYBDDATCDgSeuGXdNwkoUrxgYOdEgac7TWezmwlK4tg/1Mi04MiJQtIV4cFaSBh6TMnYwgNEaBvvBVtTQMF6Bbjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751664466; c=relaxed/simple;
	bh=Kgg/RKJy8xEDDuxlWknvCpjWS7jJF/UFzea/o+2ajss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lU0cRRlCFw8eQNJVLWS+7peCjMUfW31GkS2u1fC351TQukjSOssKVPmSct4BNyEyHqWF7zp/oUQIj6vciIrZsBpKCeBLVMfnX1NiltvHuQCWH0zM4XZD8k+AQIltJSAnZY0aPcmBRdLayAjQ/fhnvJlmHzb5tQ+S+TftsmzZ+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=D/W6O1m4; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="D/W6O1m4"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a44b3526e6so20381601cf.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Jul 2025 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1751664464; x=1752269264; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TQkwHrKOM7GBKYdSow9FOChuDO7+LFMsjIK09/6sn0=;
        b=D/W6O1m4kvzvw3gw+xtZJffd2vYKhKkpVRpfW2Lmj6L90jjHNte6XJt5Aalp8op7g4
         SGWgLawjO2YuhrK24QA8rlfQG2m78Fd3BgfjgQNRi7JiSV09T/8/v0AIJzGp2rx68AyX
         JwBKP+iwlhxkfHBNDVqnsqebU5vyveyi5N2PpoJ49Rb0Crwl+GLQqYmSGZzi8snZeugA
         fVgc/QP9vDhsZrkc8duwpGYKiyMN20pRBa77kiCzdbkH6QwI1m4OaDErVMdXhdIwncA2
         dPu9ifcfePujky3EhIvGkQ8Xdcye+6irLZBA1AtdqcTHe0mvmxbLvGLSv22ZYEZ2fjIs
         FqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751664464; x=1752269264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TQkwHrKOM7GBKYdSow9FOChuDO7+LFMsjIK09/6sn0=;
        b=gu4S60vEQXHAYP4s0ZaF/sLFYuGS8c8wp+EQL7q1LFPibbRahs7pRVRx7qaTralFh1
         ASqDOXvzT0TvQgrePKRY2eESeBwG8CVl6JsYsLrdwJOhoQTKGXWe4IjluTsKUoWpVrwW
         hDr5MkMQYkmQY7KjToeYDVtnnPVKeh+cUmzdAr3w4UsHWNdEZBaoQgwWj+ReFO6w2l/K
         BWg9SYfYLiye3UgojVjXsWhBrciIW9HyIYFZ8thLNNoKS6uvis+pbiI7CzC8B1H4Hqjo
         F3sFHOZIomshunLQdtZMOm/jAPsKbtKJXul0dIBRul1zjw62svN5vx1rJuJ6QX7+xzjk
         5pZg==
X-Forwarded-Encrypted: i=1; AJvYcCUQXx4I50FLyDCW+4KO3njij1NlUkGt5/Cy42ub1lKu6rNr3joiPDo5Df3xdbh7zvPGFRvhRmt7L1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaK7p76O1tNzDHM+VznfsB2hQT/r9S/ZTn5wrEpGzjduV85nBj
	Mzga/qX0oWV+601Jz/BzSrVW7R2GE3GD7Wj618W/EnTI5719QkqKFcSwAi37M/Z0F7PZdFCqDTZ
	S8wJsLAiGa8U4y7yMgwCwro/4/c7OMvcohprvsNsfaA==
X-Gm-Gg: ASbGncvXxoc3LKNgaC1fBdE2WbSnYhQ79dC8g+5Gsuh0yB2eEAcgHAxA5G/+eZxnrgs
	VP4RkYjAnjGR8YFbcY1xKNTT1G7HrScUA6GUJ4SoKYnYynXUrRTkiYKsrs8I+iV9dKomupCYOhX
	Ar21zHWMETVVJnSkE63cDdj9gtSxCg6zJ1CdiX96w3yoE=
X-Google-Smtp-Source: AGHT+IGwRxeilUXnNTdyTmvD/TxGpaex9AA5plhgd4LQeziorhQNSpF9IPdyc2W55Icnyp7w2dKKaCqhFLE3q9BjF14=
X-Received: by 2002:ac8:5ac5:0:b0:494:a283:1c4a with SMTP id
 d75a77b69052e-4a9a69609f8mr6114921cf.32.1751664463660; Fri, 04 Jul 2025
 14:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
 <20250625232653.GJ369@kvack.org> <CA+CK2bAsz4Zz2_Kp8QMKxG5taY52ykhhykROd0di85ax5eeOrw@mail.gmail.com>
 <20250704173340.GL904431@ziepe.ca>
In-Reply-To: <20250704173340.GL904431@ziepe.ca>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 4 Jul 2025 17:27:06 -0400
X-Gm-Features: Ac12FXw2Yd-cXQEJ8nXkM_HsCPClfwCnN3pDQjubPyn-7sQcW8XOW2RmSJQEGm0
Message-ID: <CA+CK2bC6iUfh4Y36oTVfsbTgow+3D7V9EE=Gj5jz4hsk0JU+xQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/32] Live Update Orchestrator
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Benjamin LaHaise <bcrl@kvack.org>, pratyush@kernel.org, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 1:33=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Wed, Jun 25, 2025 at 07:44:12PM -0400, pasha.tatashin wrote:
> > On Wed, Jun 25, 2025 at 7:26=E2=80=AFPM Benjamin LaHaise <bcrl@kvack.or=
g> wrote:
> > >
> > > FYI: Every one of your emails to the list for this series was bounced=
 by
> > > all the recipients using @gmail.com email addresses.
> > >
> > >                 -ben (owner-linux-mm)
> >
> > This is extremely annoying, I will need to figure out why this is
> > happening. soleen.com uses google workspace.
>
> b4 also seems unhappy with your mail:
>
>   X [PATCH v1 1/32] kho: init new_physxa->phys_bits to fix lockdep
>     X BADSIG: DKIM/soleen-com.20230601.gappssmtp.com
>
> Though I spent a few mins trying to guess why and came up empty. The
> mail servers thought the DKIM was OK when they accepted it..
>
> ARC-Authentication-Results:i=3D1; smtp.subspace.kernel.org; dmarc=3Dpass =
(p=3Dnone dis=3Dnone) header.from=3Dsoleen.com; spf=3Dpass smtp.mailfrom=3D=
soleen.com; dkim=3Dpass (2048-bit key) header.d=3Dsoleen-com.20230601.gapps=
smtp.com header.i=3D@soleen-com.20230601.gappssmtp.com header.b=3DVxWLPP8s;=
 arc=3Dnone smtp.client-ip=3D209.85.219.177
> Authentication-Results: smtp.subspace.kernel.org; dmarc=3Dpass (p=3Dnone =
dis=3Dnone) header.from=3Dsoleen.com
> Authentication-Results: smtp.subspace.kernel.org; spf=3Dpass smtp.mailfro=
m=3Dsoleen.com
> Authentication-Results: smtp.subspace.kernel.org;
>         dkim=3Dpass (2048-bit key) header.d=3Dsoleen-com.20230601.gappssm=
tp.com header.i=3D@soleen-com.20230601.gappssmtp.com header.b=3D"VxWLPP8s"
> Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8259b783=
f6so264959276.3
>         for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:18:45 -0700 =
(PDT)

Thank you Jason, I think I found the reason why this happened:

While DMARC itself was enabled, the Quarantine/Reject policy was set to non=
e.

I will resend this series.

Pasha
