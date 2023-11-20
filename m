Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lXCLjvmP"
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C76494
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 08:21:40 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d0c777bf0so14327156d6.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 08:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700497300; x=1701102100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+cEjF8yivWHKRs1/Mvbzeyp4gbt9nPyK/LY9ULoheM=;
        b=lXCLjvmP+CHaGpri4tFOQW6WKQONMR0Hlj0xoKc+oBLJmkfw+x7efIkl/qg6tUM5Fk
         JToiIyL9aubHpv4y4so+Th1PFanvrm/geMUndoVu9oItTH3zc79uGmoSzVGkzZpm+RSO
         6jcNzG5/VwyLl/U39ovk7sIE/6EsyRknioCytjNN1sOLiLCnA+b/nJlH98aYdMjLBeVa
         MI89Nj+2MZDwC5r0vKiPozQUfbg/aBafhh1CPrUQ1RRfEC/AUM8gqcaxdnQcWCwbOTWA
         XLV5rb8CIk51fXDaw1csBzpJemRWLAs0REoM2HISUPc6hrNnIPqxwjGN5cQFX6jV/S1m
         t0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700497300; x=1701102100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+cEjF8yivWHKRs1/Mvbzeyp4gbt9nPyK/LY9ULoheM=;
        b=iYazdc/62Yxqg8eLAQ15ylYa+vqhjNi6H50uWM0/YX67+Uo6gFG0az5g4SPwB8VHsw
         dCSGmyb7jWXmyvdbuGgllnm7B+MynY4w4ZPyux5UDhprZWWGLzVvpcuTy2NmsfWN+i6f
         d+L/YgPXnMBFKCvsb5MVSLBJyq02OFXx2SSsPyHZrS3q/Qg5aiIDxIQTV+6Il6vnxELI
         jV78IBYRfgQDrxLHXwJfegbw9Fc9ppUwch8wyLhP0IzuwIK6q5guZumU28ei30zdQnKe
         fqdJTF25Ae0bYsCitK42cWA3BOGbingsAOlAt73fHBEMcgPQDbBttJvM3BWRNmxy47ZL
         kjcQ==
X-Gm-Message-State: AOJu0YybgqZY2B6wf3v+Kon7m6QIZrANwh3AnG7O8i3T7fZkCwu/sLqC
	rZdT31co2i5029tD42DtPNpy6yCC4m0bMhpAq//K6g==
X-Google-Smtp-Source: AGHT+IEtPYBbq49KqVNQjGJ/GDDR3Gw4BTcMZhzzT9PPj/JSL5e5Zf0eXOFkX/x3KPc5URlWDs3TZ7+JKzHJiRKIMzs=
X-Received: by 2002:a05:6214:c49:b0:66d:6afb:ba5d with SMTP id
 r9-20020a0562140c4900b0066d6afbba5dmr9779202qvj.24.1700497299711; Mon, 20 Nov
 2023 08:21:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231103061715.196294-1-sumit.garg@linaro.org>
 <CAFA6WYNW_cAFVMTpqPQjwBASKDp_b=CpccCzx23jHn_+qoJrDQ@mail.gmail.com>
 <87y1es5xsd.fsf@meer.lwn.net> <CAFA6WYN7ZB0Sgc0gB1rQhhirjoOEeyp2Uokzpwy-KFQ_aJQEVg@mail.gmail.com>
In-Reply-To: <CAFA6WYN7ZB0Sgc0gB1rQhhirjoOEeyp2Uokzpwy-KFQ_aJQEVg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 20 Nov 2023 17:21:28 +0100
Message-ID: <CAHUa44EqH+_+CbXAAdW=xGpFm8DCB=fhrFZcXgs1OdW7VRJ6-Q@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: Destage TEE subsystem documentation
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, vegard.nossum@oracle.com, Rijo-john.Thomas@amd.com, 
	balint.dobszay@arm.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 4:35=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> On Mon, 20 Nov 2023 at 19:31, Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > Sumit Garg <sumit.garg@linaro.org> writes:
> >
> > > Hi Jonathan,
> > >
> > > If you are fine with this destaging TEE documentation patch then will
> > > you be picking up this patch? Or would you like Jens to pick it up
> > > with your Ack?
> >
> > I'm happy to pick it up.
>
> Thanks.
>
> Jens, can we get your ack here for Jonathan to pick it up?

Sure:
Acked-by: Jens Wiklander <jens.wiklander@linaro.org>

Thanks,
Jens

>
> -Sumit
>
> >
> > Thanks,
> >
> > jon
