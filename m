Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFF615ECCC
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 02:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762741626; cv=none; b=uPEs4y+RcJ7a6W6rW8pS7puc3OI37fpJmzpn6PXSVE8Ah4lRknJHMujFkA8EPH+D4x5G6ioO680uoJJbS1u9nUjh1nmxQ5Yrc8siJNRlFNNVUjifSEUI/jShHKGCUYUFqW4hAVYkaTQjJM2DGiJaa0QHnXTj1zH335/BFFmR+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762741626; c=relaxed/simple;
	bh=7nmmqVl1N5N20DGFXlx5/q7VZBrB7/oaoEQ3991NUd4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFn1dhZB+LeBYgFzgRJ8E3o2ONA31bn9qvn/jlTQsTXcPAd/QAvuv4q+5zT1Kg9yi9SNdot+KCKxStgOJt/qHkjn/UdKmTsF86F3BU9D1WVZsKtTkQax6mfmWfBjaLpqdyQU/F/ozFVovheTsv5jkQAf46oCPYFJ95tVkG34T7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I6xPGCi2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwLcOsEh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I6xPGCi2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwLcOsEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762741623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7nmmqVl1N5N20DGFXlx5/q7VZBrB7/oaoEQ3991NUd4=;
	b=I6xPGCi2nHJpjzbArO+YsGmEDB5QH5brlYbVO4UdS9mfoIKbm8PMxLD2lfDmCGtWg7zFJV
	Y2gnWb1kaEHdrZmteM6S2KsL0yDfOPIvSBNXVNU0If4gK0rclFHkjZDqKC5yHfbAN9wXvP
	kUnsTyQnpy1m/8424p/3GT6Oa3pzn5A=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-gzvYVe_IORyZU1I0TYfKqQ-1; Sun, 09 Nov 2025 21:27:00 -0500
X-MC-Unique: gzvYVe_IORyZU1I0TYfKqQ-1
X-Mimecast-MFC-AGG-ID: gzvYVe_IORyZU1I0TYfKqQ_1762741618
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-37a492a537dso19395151fa.3
        for <linux-doc@vger.kernel.org>; Sun, 09 Nov 2025 18:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762741618; x=1763346418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nmmqVl1N5N20DGFXlx5/q7VZBrB7/oaoEQ3991NUd4=;
        b=MwLcOsEhG19VnlzGej48Ca9hqdS3gIQk/zFVLTrUdDnhaiJWOqGu12PCiDpiEfwj+Q
         L6agQMPp6JQJQbuJeZElsl4+D+IsK05Aeyx8YHlkCjZZM0djJ1OWfk5uydwBuf2Hndkw
         5LYGHaBTfvuG5LoWefElsLKq404MJvHmSSWN2eZ5DSUJEQZye6WHdDrPgYfhYl4b8Xk8
         JZtfVOf1G3yp0JKF1d2Z0C1gOHOTEaMxqh+hFadXqRa406UpRX7wtSjJ8gMU6Neac9gn
         0Y28o7J4usw3TcELniyP2ODs8gVwdf1CQmAYzs8fdD/TXe/GbfaIBEe1F50c66QgiCMi
         dPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762741618; x=1763346418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nmmqVl1N5N20DGFXlx5/q7VZBrB7/oaoEQ3991NUd4=;
        b=dbjy6CkHi951otdPiW7KF1i2DFuupERSuSVrzAbXo1b0PBoFX9cWMe6wEuK3e3njgN
         D2EvVYeWAIuEFwze4jekJYPctuxj19cqSmyPpBOVbTRg8IkThAe9NTNYXBioO7RIim2B
         70gMT5BFV/xOOruHAL7V6r/LTWsNi+/GY5G1aXbGx0rjifrfYgUc8uMCqm7n3u3Kewsa
         wqHviaLrSEFVRqBEfhlnhuaaaJv/aIsQrz/AK6UpAvN7ExJcLz6gfDzBUFRCXvo8vTbk
         IUf02CNBix6SERMiZFG6a0tgk6zYNPxtf0FY/vAGV2fF93lxQEYLeGXpfuJYyaFFgFfL
         c80w==
X-Forwarded-Encrypted: i=1; AJvYcCWEbxhEtUk/N4Uur2JV9P+3hRaBKhQSRGN3a/BRTEzrZsng0gU3Oe3Dv1HKEPalKsOuySicKUXaW6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkF3d3LoAseB9p5KvA9fUnnaYHMXvh13oRJ/2MqFgar2qkucLc
	duJZ5uP6LxLkk/r8O/DfyuhmptlmIFxJIC+uuIRFmW3F194yH3QJGbHF+e8oytzlysI2W9br/97
	pRWxtPVDnMPOwE4fX22INoa3/K0aRn76Q+idvdbIeTa5sI7owJUPxI8IE1LQrbiWvtriPLDjabi
	NgJCgxjOOnYcXEaxd6es3PQSkeYqrtqD7uSlCe
X-Gm-Gg: ASbGnctp0mzrNK6A64voUGUixmg4d+a4Kn7Dnz1T/DnBvOY3Rc1Bj9bS8ow+Sy9bZas
	QyWWYLAaM3KdlmXzVb/4N/+JeE1KtSrzituDQHOsuMcU4ud+yKFc9NZjUTpCsY+ZYT5/Ai/kvQY
	BIkluY54NmKdTGyvrkEVZiZIHhq/S+OnzhJAGxx19vF7nak0AvnViVnLVS
X-Received: by 2002:a05:6512:3e22:b0:594:36b3:d1f9 with SMTP id 2adb3069b0e04-5945f1af20bmr1658108e87.25.1762741618370;
        Sun, 09 Nov 2025 18:26:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0OQ6POp2DvyduBqF18x2+BBZK5JQ/naempoem6bDJMgcg6osM3jUe/Zm740VX/IypFp1wgr5Bj9sbYSUkkJU=
X-Received: by 2002:a05:6512:3e22:b0:594:36b3:d1f9 with SMTP id
 2adb3069b0e04-5945f1af20bmr1658101e87.25.1762741617924; Sun, 09 Nov 2025
 18:26:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103125757.1405796-1-linan666@huaweicloud.com>
 <20251103125757.1405796-5-linan666@huaweicloud.com> <CALTww29-7U=o=RzS=pfo-zqLYY_O2o+PXw-8PLXqFRf=wdthvQ@mail.gmail.com>
 <a660478f-b146-05ec-a3f4-f86457b096d0@huaweicloud.com> <CALTww29v7kKgDyWqUZnteNqHDEH9_KBRY+HtSMJoquMv0sTwkg@mail.gmail.com>
 <2c1ab8fc-99ac-44fd-892c-2eeedb9581f4@fnnas.com> <CALTww289ZzZP5TmD5qezaYZV0Mnb90abqMqR=OnAzRz3NkmhQQ@mail.gmail.com>
 <5396ce6f-ba67-4f5e-86dc-3c9aebb6dc20@fnnas.com> <CALTww2_MHcXCOjeOPha0+LHNiu8O_9P4jVYP=K5-ea951omfMw@mail.gmail.com>
 <c3124729-4b78-4c45-9b13-b74d59881dba@fnnas.com> <CALTww29X5KizukDHpNcdeHS8oQ-vejwqTYrV5RFnOesZbFhYBQ@mail.gmail.com>
 <8e240c3c-3cf7-4d48-8e13-2146a5d36c2b@fnnas.com>
In-Reply-To: <8e240c3c-3cf7-4d48-8e13-2146a5d36c2b@fnnas.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 10 Nov 2025 10:26:45 +0800
X-Gm-Features: AWmQ_bkEWK74DgGkBNl4ou8Ya5SG1OvgsF_zE3BWVU95djqIT-yojEdHF1L42eM
Message-ID: <CALTww2_hu3uocnYvJTViL88A30WgVPHs3-ZHgQYK2qgB0S9b7w@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] md: add check_new_feature module parameter
To: yukuai@fnnas.com
Cc: Li Nan <linan666@huaweicloud.com>, corbet@lwn.net, song@kernel.org, hare@suse.de, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-raid@vger.kernel.org, yangerkun@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 1:06=E2=80=AFAM Yu Kuai <yukuai@fnnas.com> wrote:
>
> Hi,
>
> =E5=9C=A8 2025/11/6 22:56, Xiao Ni =E5=86=99=E9=81=93:
> > On Thu, Nov 6, 2025 at 9:31=E2=80=AFPM Yu Kuai <yukuai@fnnas.com> wrote=
:
> >> Hi,
> >>
> >> =E5=9C=A8 2025/11/6 21:15, Xiao Ni =E5=86=99=E9=81=93:
> >>> In patch05, the commit says this:
> >>>
> >>> Future mdadm should support setting LBS via metadata field during RAI=
D
> >>> creation and the new sysfs. Though the kernel allows runtime LBS chan=
ges,
> >>> users should avoid modifying it after creating partitions or filesyst=
ems
> >>> to prevent compatibility issues.
> >>>
> >>> So it only can specify logical block size when creating an array. In
> >>> the case you mentioned above, in step3, the array will be assembled i=
n
> >>> new kernel and the sb->pad3 will not be set, right?
> >> No, lbs will be set to the value array actually use in metadata, other=
wise
> >> data loss problem will not be fixed for the array with different lbs f=
rom
> >> underlying disks, this is what we want to fix in the first place.
> > But the case you mentioned is to assemble an existing array in a new
> > kernel. The existing array in the old kernel doesn't set lbs. So the
> > sb->pad3 will be zero when assembling it in the new kernel.
>
> Looks like you misunderstood the patch, lbs in sb->pad3 will be updated t=
o the
> real lbs when array is assembled in the new kernel. Set lbs in metadata i=
s
> necessary to avoid data loss.
>
> And please noted this patch is required to be backported to old kernel to
> make it possible that array with default lbs can be assembled again in ol=
d
> kernel.

Thanks for the explanation. The patch looks good to me.
Reviewed-by: Xiao Ni <xni@redhat.com>

Regards
Xiao
>
> >
> > And as planned, we will not support --lbs (for example) for the `mdadm
> > --assemble` command.
> >
> > The original problem should be fixed by specifying lbs when creating
> > an array (https://www.spinics.net/lists/raid/msg80870.html). Maybe we
> > should avoid updating lbs when adding a new disk=EF=BC=9F
>
> I don't understand, lbs modification should be forbidden once array is
> created, it's only allowed to be updated before the array is running the
> first time.
>
> >
> > Regards
> > Xiao
> >> Thanks,
> >> Kuai
> >>
>

