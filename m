Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B617557
	for <linux-doc@vger.kernel.org>; Fri,  4 Oct 2024 01:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728006436; cv=none; b=BO9dCzgdFxRzCfTdyjOpInJ+E3ha9mte0lVG7MrN4vDjWMvwUU0B0Ja22fE5D3In55pOOy8/0KiW3sP1r/g5hyTzZ+hNHYNsHDNUHgi5yWm74pcUu1+qvhWigseSMg2WJ46BJ/uiCE3/K9yb7D5Q4khCPK45wxHoRoiOAtIw6Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728006436; c=relaxed/simple;
	bh=jWhLiPBW41FdTIfWkftjHB5EDEXKmY/wjby+BrMqkTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyS08kWyeqRb6BYtWvVwxD3NC+But1CdEYTazI//CxwOs7HJCJCUrkYdtAR/QGYc/FOS9YK1gxjtyJ6UYLHtq+tkZfl071R8un/v6/61Bv6piTf1onM82xsqzl7yYKJwei6S+pdVWnWxYmOIMEmjiY/PPBY03z9T0PQgno0q4uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WVIEgTfl; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WVIEgTfl"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4582a5b495cso78161cf.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 18:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728006434; x=1728611234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWhLiPBW41FdTIfWkftjHB5EDEXKmY/wjby+BrMqkTI=;
        b=WVIEgTflKv/W5Cb89cp/2jRNuP4dTgjd+1YoK2dk0+RQDtfqeKePNZqrDj+7biaRr7
         3edysfHwH5Xz6lfGQjiskAiw3yFhqHvR2WIBAQBFAoMBNCjKqtXbRWvfQpUKCF9m+JKD
         0EhZk7k9SzfjoBnoARh6sob2nlDlkO8r2eOjQ2VW9HBTRrUf8WOav6PzRU2Gtv5bRp2X
         lsFmb/iKicp7WwsvtyGCYdJhFmzEomz5IOuV+4fpykPtN/eDfmvi80xfUdQzuKDqEGIk
         wmSuVMzdm1ct9LlXNmqRiJTVhvAJ8aMzxLH+XZn9INs/meCPEiuYHsmYOT4DWM/+zlYl
         uIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728006434; x=1728611234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWhLiPBW41FdTIfWkftjHB5EDEXKmY/wjby+BrMqkTI=;
        b=vRxj2yxdh8n9fRuo0R4LVXlvqyNE+jDfTU9YCZiASE1tQ692Pn3J65c4N/4xWVdMDu
         YmlbZNUN8GV8hOKg9Cs4Lnq2VZHvqDRgg1Bg2GmQXbULc7d80qEj6Mt0CnOpJiEAId8L
         88/WkiNkXESnJWrwWdnIEWxpUTt3fEj8/+qqGqhkuw0C79NnjZamlHyFWOvZ403kFxvW
         iML0KQvttMaNuL8DxQndbKDvAHve6SL7uI0q7YUZ37UNHp8c1BLLAiK6JwSuG+qMZoue
         3f8dL2rXRjveRlV2z+rt1iTfhedDOmJ8Bsg4EYHgSK3VOrNUxQGZXnTbAB72dnZGpmua
         9X5A==
X-Forwarded-Encrypted: i=1; AJvYcCWYc6cZLWyGHKAiVY0RtUo0Zn4Uuth54tF+mPt04g3ozcqKvOil3RLTUimh8p1I5lYEWSydfQRTHaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIWkCDA77YDGuCkC4ej6rZUpcactJithbQIv6OykBLoRsQM8nb
	HTWFhw9fMbcfz+3c3jpdrY0Rsjf6MmXtoq2fPNoRgIutz/Up2uIcibTu95derd6kgmMRAlilSis
	k3pqL+1Bs+Rgep63wl7HuZRCmB4Edlv78auVzqAseCTmGBp0ZBA==
X-Google-Smtp-Source: AGHT+IHNVzTHa1hLn+uSohipdrPbr5/3CxPcsBTKfk5TdgjkC0eYfb1LL/AtFiG51Yko8eompIIi+wSlL99GI2oHS4M=
X-Received: by 2002:ac8:64c8:0:b0:456:7513:44ba with SMTP id
 d75a77b69052e-45d9bdaaabbmr1463221cf.4.1728006433660; Thu, 03 Oct 2024
 18:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003160620.1521626-1-ap420073@gmail.com> <20241003160620.1521626-4-ap420073@gmail.com>
 <CAHS8izM1H-wjNUepcmFzWvpUuTZvt89_Oba=KaDpeReuMURvQw@mail.gmail.com> <CAMArcTX0sD9T2qhoKEswVp3CNVjOchZyEqypBcjMNtQRHBfk5w@mail.gmail.com>
In-Reply-To: <CAMArcTX0sD9T2qhoKEswVp3CNVjOchZyEqypBcjMNtQRHBfk5w@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 3 Oct 2024 18:47:01 -0700
Message-ID: <CAHS8izNZhr6=82Piv74V1HuVT1X+OEEyxUXs-VU46KJt3Fu5mA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/7] net: ethtool: add support for configuring tcp-data-split-thresh
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	donald.hunter@gmail.com, corbet@lwn.net, michael.chan@broadcom.com, 
	kory.maincent@bootlin.com, andrew@lunn.ch, maxime.chevallier@bootlin.com, 
	danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com, 
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com, 
	paul.greenwalt@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	asml.silence@gmail.com, kaiyuanz@google.com, willemb@google.com, 
	aleksander.lobakin@intel.com, dw@davidwei.uk, sridhar.samudrala@intel.com, 
	bcreeley@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 12:33=E2=80=AFPM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> On Fri, Oct 4, 2024 at 3:25=E2=80=AFAM Mina Almasry <almasrymina@google.c=
om> wrote:
> >
> > On Thu, Oct 3, 2024 at 9:07=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> =
wrote:
> > >
> > > The tcp-data-split-thresh option configures the threshold value of
> > > the tcp-data-split.
> > > If a received packet size is larger than this threshold value, a pack=
et
> > > will be split into header and payload.
> >
> > Why do you need this? devmem TCP will always not work with unsplit
> > packets. Seems like you always want to set thresh to 0 to support
> > something like devmem TCP.
> >
> > Why would the user ever want to configure this? I can't think of a
> > scenario where the user wouldn't want packets under X bytes to be
> > unsplit.
>
> I totally understand what you mean,
> Yes, tcp-data-split is zerocopy friendly option but as far as I know,
> this option is not only for the zerocopy usecase.
> So, If users enable tcp-data-split, they would assume threshold is 0.
> But there are already NICs that have been supporting tcp-data-split
> enabled by default.
> bnxt_en's default value is 256bytes.
> If we just assume the tcp-data-split-threshold to 0 for all cases,
> it would change the default behavior of bnxt_en driver(maybe other driver=
s too)
> for the not zerocopy case.
> Jakub pointed out the generic case, not only for zerocopy usecase
> in the v1 and I agree with that opinion.
> https://lore.kernel.org/netdev/20240906183844.2e8226f3@kernel.org/

I see, thanks. The ability to tune the threshold to save some pcie
bandwidth is interesting. Not sure how much it would matter in
practice. I guess if you're receiving _lots_ of small packets then it
could be critical.

Sounds good then, please consider adding Jakub's reasoning for why
tuning this could be valuable to the commit message for future
userspace readers that wonder why to set this.

--=20
Thanks,
Mina
