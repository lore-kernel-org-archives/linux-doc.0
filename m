Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599433CC9F9
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676868; cv=pass; b=SVPZwPUmpzInH040OKzGYOXJBRSoDuzMVigAMfeHqrijoid+dwB/YC7qZzJmuDkYrhu93WXO2KSKZmv+SNyHDsOCuCCCmj6QpjzxAy4LTM1Jhl7ZdcDCEIl7JfObzknYNvWtQwSZ74UVFALc6D+l4e5kuPdo4WgzoRR+RyJILDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676868; c=relaxed/simple;
	bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqNfOL+YuMLhmquxHKHWYgnC697zOGkUo6zEQtz09NE0KnavB9N5GhcAt5CYxEDuVzz4Ej+qmrEfyFqE/0ZAvgWMH4vz0sw6p2fAjxHrC6PL6WBe0A4miYc6UipcZXMyGv6IjJ6Rzn0PF58P+zvWCRLU3UJErrZtoMhToqaeb9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRvR8jWP; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRvR8jWP"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6653b589a78so2140299a12.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 09:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773676866; cv=none;
        d=google.com; s=arc-20240605;
        b=lamablAeYUzwxHOugNhOAVY8O9aZDrv8OF2NdAsnk6Z5+3xy3X2fv/GPXkDs982BpM
         Yy57fNF7Jepxx9pdPCmdha8D4slZqQxXlGRLIYvWSmK8+8mcbD6FRdQMG4zBh3kVUpQH
         04r1qafTVPs6ISDY3m6oU6pLGBpTk7WdEtr8qFFNiYntRSA7EHrE3wf+w8nSwrRKH05c
         982DC32XrvmC72BtCLYLQeip4t4j5GYxopFOuSzcM8SNue1ZU9EzM5p//xGXlKZQ1CTu
         UG26uqMzEtb7OfBFVWAQAddxVJncH/hl8EsarSjRMTB+K2j2aKbsuUTKkFOrlf0Kix+3
         EbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        fh=hav9r7geEiPY4qRAZtLw3R0UrSzGtMnjg3qWdVTe9G4=;
        b=g1yNgrR/e9jp7gZ50qKWL3fKtQba4dofQVkDz5e4lOhxkdcXDgoIxhs1yHCKOokE4a
         IpW91daAEya+OGPclAhDLsgoq0sHU7G9yiWfswCD9A0J1/mpDbzPMdG/ZTq1ACdMB9tr
         JKJnHH84usC7YYhvGFrdz6NYx99Cyd5Kiv2CkEO8DLti8IVgpq7d75HzKVBPpLdEqBhY
         bV/7CTnvreZQVlG1Okw5hR9ScARB5NuV8W0pQ4/LLQL3I6dPIk1nU8LTeng77Ot5klpP
         NoaeleCfzCyVOprFSflMSsj2mlZlRDTO3F9Ox5KOGwB/dnVQcqzGoq6FfDyeftKdm29I
         Tchg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773676866; x=1774281666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=tRvR8jWPdYpapywuFbFHAwdbkmfciAm97lupRo23Lz95ol4WDw47KF+V049m3ECDKP
         khDfrPMN6aR/vimprZmLRF6GU2CkUGsd4Jv5xtJGU+u1yNjoX+Yy544KdjdWYeVUqwvP
         PAuT67hKYlEjtdFL0MRqVeSCfe5qhhfNz5y8pDlti3aC5sbdN5iYW7S3kFsgmreBC4CN
         qAGJEDXXCt/WGvWjeZrLQIJq7Yect+cT6Mb1tiyLaxvjXE+m/ds4hH8ov+Y8sMqZNrSm
         SWPoHKrCT3TVDDSq/C0ySD3PoMmRqSWtUYuAZVCOsx/LSb4q+nVLCCHHlStxxvaawLlT
         Ym6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676866; x=1774281666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=ILEYWLpMEY4IYN3i/AAiehn2JbnyLVG2V8lbxszQhZc1dYUzwgjV68ARDNqShYV+D2
         t4Og4ArNrCljp5abLqk/0t5/cUDLKMyOQCLw1ws+7jePV/ZU7qzPTVj/Hw6/Td/5af43
         qLNWoPtWJWdC6g0/il1hqVbnvnf2b/bsoroOIl1AUdCuTetIXbMx5NPGW9xwhyzOBCqH
         YDizu5S8yiJq+4X4RngVlbpKiVl52wYWt7dNTfybFJ+uwkbbtlFJKhIEvJocR536I4o1
         8uacBPSMD0M6yMu/dykvh2fhuJ0hGGas0Q66vVwjnmr/XOB93Rob8NgwhS4axHY3S2Gj
         svDw==
X-Forwarded-Encrypted: i=1; AJvYcCXmmpNE0GgiSBYYjluqk1wcGr7EP/V6U6PMhx8+WNtshCi6Ad7Ro26rLcnU3syxQQintVPF4PcBX84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1hbhJ+o6OM3ineA5zpH05LCHE36eCA7+BrW/QKbUOl8AKy5Vf
	3E9NhfeU48IB6u1HCOAGPIwAnoafoC11Hg1mg1suhLT67HUne5hEPQQEnos+EVVIdgdUmapwwXs
	DPdjCqsFuCVCEKAMWyNNyjBCqEwdhjD5FOQFxMNFpxQ==
X-Gm-Gg: ATEYQzya3xdAKdamlufF7LofMArXl6JN9rTkIGOqz3YI0jePXEQ9HG34HVGlteFDj/O
	XLhW9FwSacmq+LsYiuec4EvE2NevVLL6iIuStvtACXzlRNl/JThpHHKN+FsBIsTndrI5fWsTfPo
	RZEbFGyWeJ5lvLCID/Hu0sqchNqPXgk3/B6UDUlkgv+0YXNAfcbK6EZOy8oaAubnDXkXIN7/MoH
	wQeT0XQngQZcl37kBOA4/maoBckj5W4O5eJOuLCSrud+z26fiYyHxbZ28OOPUWsOK7/x0WqPSzU
	XGwEeOnVbVBGyHt2hgAoccibnskx/0h/w4uYdlNxig==
X-Received: by 2002:a05:6402:51c9:b0:65c:2af1:b7e2 with SMTP id
 4fb4d7f45d1cf-663bac17dcamr7423927a12.27.1773676865593; Mon, 16 Mar 2026
 09:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com> <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
In-Reply-To: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Mar 2026 10:00:53 -0600
X-Gm-Features: AaiRm52a6xRhLIv8WCDX8JG5wzLTI5tmdCIrfHWi7mJRzbOdI91SV43T2PYw5ig
Message-ID: <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding Andrew Lunn]

On Mon, 16 Mar 2026 at 08:23, Linus Walleij <linusw@kernel.org> wrote:
>
> Hi Shenwei,
>
> On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.co=
m> wrote:
>
> > Support the remote devices on the remote processor via the RPMSG bus on
> > i.MX platform.
>
> I think v12 looks pretty good, if Arnaud gives his ACK on this patch
> series I think it's ripe for merge.

Please wait until Andrew and I have provided our RBs before merging.

>
> Yours,
> Linus Walleij
