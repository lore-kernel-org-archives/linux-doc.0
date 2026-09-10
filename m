Received: from mail-qv2-f11.google.com (mail-qv2-f11.google.com [74.125.230.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F152483BD9
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 14:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051370; cv=pass; b=bDpxknrqhRZOmDWO08aQ6O5SS3GuPJAtidYanGbTwXmYGCRpUL97hCzkkeCYU5YsE7IQ0XlSwBv98Vjvu4cda1jAwh3y3R5Xx3dwRvb/APXiH8njCS88Gmfzo1NfbzCOhd1uJ3drdEvZxgMwRGnOhYPjFIvMzOC9s1T2LeO5ZBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051370; c=relaxed/simple;
	bh=A3NBwT3kopqU6rUQDfTU2NVJM1JpMiHHARAEukPCTcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNP4pFCYMkOTp/BFgml4ZEyOzZhlC4atfsB75qIzrwDjX5QBiZ0bFsEUtWWOniyg99IfkuxG0Lq8fIGjkzA6/4Zi4+btqBPVgx+JQOb2MRGcEvzOuH6pAhet1Ph0V7jwzlcICy6eyYbimdrYHYEADldKmr//mNAeBB/9Ueh/fFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxBUDI9n; arc=pass smtp.client-ip=74.125.230.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxBUDI9n"
Received: by mail-qv2-f11.google.com with SMTP id 6a1803df08f44-90cdfc57039so20948026d6.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 07:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789051367; cv=none;
        d=google.com; s=arc-20260327;
        b=qy33Phk02Hw49pW3YGDeOkNPPaHvNltBTlMfXDLnonwAVnREMDWs3ZCopTj6f7ooXL
         fAGN190elVDOZ4jU+FHzuTWAi1sSkYVGHAKZh/0VgePACD0gDKKs5z6J3V0pBTmdLTxi
         /4ABV86hAyp4P1/XHWkK/D2QhXROgarBL6X3p2pLgHC/AzSlkQO+DR799lKVHjwUj3Jq
         cQ3Wbpllitq2ISlgLb/qoGox/UkKzqD4pWuVAGjkyk+DRvWIc0H0JuLFNewcJnG78RvL
         Vomj6vJkZ+1UWn7Mu1iopRztMu2aNPNg2i2srHDl6YZjdNDqkOTOWtJhOjNYMQed9vSg
         TI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A3NBwT3kopqU6rUQDfTU2NVJM1JpMiHHARAEukPCTcE=;
        fh=OLacKcceFhOGxHuyBn1pHreD5SLtdhXPFBaK54n5tHE=;
        b=EDr8Qh9dIeX3jqWGC/0xsS1Ei/L+hGHvtkWb+eCezXY68967kUmj3uRrGwnCRF0Ydr
         yPMROpaQJdaYh+tVTCrG9MuW/hoBEjdDgUh2nKojLAeuhYqNxVRHVI1vQMsXm8lXvIwM
         QHdEtOnfj5rkE/6mv5r7dwqrcKIGOVhQ2CtrA08X7G6tCBbb09/4UgnYomsBFGOF3xfY
         svgKGRzhLo/C7BLDKgR9pLIwUAg9tm9dTAj3USrSkfd1iz3ijIoIKNUpRtfMNC1kd5qa
         B4PkRumduiJ8Zw+2HH76bzHj3N/hBBRIkC1dJj+ZnbgLmR0GRJJCqoDGozu3XqgsTVI3
         dJPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789051367; x=1789656167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3NBwT3kopqU6rUQDfTU2NVJM1JpMiHHARAEukPCTcE=;
        b=KxBUDI9n7UWsOjc5rlh9Gwf2PJ0D/+LSYmdyy/6oismbd/nrNNM11K/IDaDoT+tgJN
         jQkC2FE2up5sDZc9f07MYtbi3YLC3wZtGk+4//pjfjFoJejFAcmwZdTUUcgEim/+P7lk
         Xfme03uKsGP0a6rqH70uMnd3510615o1kOK8vUyNpUmJlumXGdfp+RQDkgkZY93Dvz8h
         wr0T7PYN1eO93/LHWAsWAnts6VSRJ8T1nlIpOjEm9WXVwg0YyQJaurFk5AIisfd+RtsL
         j7cUBwr4AIlutYdKHnXPf8KPsFiUPAVyfSD1jUxiHz+dF1itJ/v5bBIWb2bOymBIXdwp
         c/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051367; x=1789656167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3NBwT3kopqU6rUQDfTU2NVJM1JpMiHHARAEukPCTcE=;
        b=GDxGcx/lJ0jv3Y9R6ftpt3Yevge+j/UsDXjojm+E/Q/M9w6hat8wr7BHd99Xd13wlI
         uhjRHj+8Q8+usS9VAjZaan3PtO79ZdekVA2PyfaYvBmLW8/TEXkIa/In2XqGEvrCuMsb
         S00ektooyz9nCZULOww1zdoun3be09QkY2h2uVE2emm3dDaZ8u7TnnJTiOHPP5/w9jqU
         +a/zAN+uDwBc+dzZbphJcGf1Lbx0jkI/DRrfDOaCDzytys/6BpnD0PgPq6h74OX95tYd
         Kmtv3ZfR2mrQOc8WEXgwUUchaFpY8WYsJP2nuVWuYRnh3qfiBwN8NYqj4T2PP4hs7WJI
         Z69A==
X-Gm-Message-State: AFuF++m4DFsWXTfQNTochbDnmsNo/febgTym2SFG11khlHPgz3r/Vv4Z
	muPjTt+5LbuZius5IrCl76s6OlZrER2vPKW8M8tr4ZdHfqnHtfodoB/Hqm/PjucwybWEi1lLiQr
	S7derfc86vOWvdF0ryu8PueHv/mStZUc=
X-Gm-Gg: AYBFou1OaD4KRColGNVS85aZsYRwZ0O7d3/fjEuzs6iE7kbFnt6yKXuhWihBsXchnp3
	SVc1lqX7YShqjBNyJTVsH0Na3pH9TwrydPUQjrA3J9AkP4c8+i67x0uzYUllBQTnZyGaMpwmWvU
	tdfvP1T3+7or+NTeXjqUGNkmWN6kcC24+JSaC0OK4RFttOCi0Dm9Ijwt2QU1h5HIPx/E7mGsse9
	pPKtWtSGjTiCEIkPGMwszuW+feW9M0AH29gklD81WOjrJUfmG/eaXDAPsDoEPHa7rxk/z8WUyGZ
	RHlUk8KGaG+i1/gIDkcoCCLAMVeivyqXxFUZAK9FOI/cZQoYK/1ijJBb3AyMwI0ykkfR93s6Qoo
	O1EhPRnz66qWxfVAmINV0rsUY70RuRkGhFf7BFJaI
X-Received: by 2002:a05:6214:5b0f:b0:910:7078:b4f with SMTP id
 6a1803df08f44-91070780df9mr133306426d6.25.1789051367346; Thu, 10 Sep 2026
 07:42:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607064053.195166-1-enelsonmoore@gmail.com> <ap6hIoGppETYr7ey@ryzen>
In-Reply-To: <ap6hIoGppETYr7ey@ryzen>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Thu, 10 Sep 2026 07:42:36 -0700
X-Gm-Features: AcwNN1Wk1zV5NERHaZeTyuW_3PUV8dF4eqEkqONhyMYLHRDUgO1Fa3RjXoXy7mk
Message-ID: <CADkSEUidf27u7U5mbB4FcDYZa5o6dWQnwf1LwT90Ud34MjfsWA@mail.gmail.com>
Subject: Re: [PATCH] ata: pata_legacy: remove documentation for removed module parameters
To: Niklas Cassel <cassel@kernel.org>
Cc: linux-doc@vger.kernel.org, stable@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Niklas,

On Mon, Sep 7, 2026 at 4:33=E2=80=AFAM Niklas Cassel <cassel@kernel.org> wr=
ote:
> This patch was sent to linux-doc@vger.kernel.org and linux-ide was not
> even added as CC, so I assume you want this to go via Jonathan's tree.

I don't think that was intentional - the script I wrote to integrate
get_maintainer.pl with git send-email had some bugs causing it to
exclude entries. I have since fixed them. Feel free to merge it via
the IDE tree.

Ethan
