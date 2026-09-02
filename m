Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065F139F17F
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 21:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788385149; cv=none; b=mF+5zkVw1PPxFsqlkV7ewdEXAiscRkdPDG338P3gMCtOnF2esb9jd7QBxR46Pkk5Lcti+qvRJQ7nuvBpzCr5E3C2Vytk4IgvsSgvOkZFyzqb7zUERmZVT2iQq5Wa5O9cMJL547/BkI9eeSGIBWCWxPdVhasvI/RTQhsmxZ47TcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788385149; c=relaxed/simple;
	bh=VCeTB6DA6xhpX0r0q0Xnripoc1RfKaEs1YtzFpOgihQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGCHJPmF106dKdEJhpZdzu187gLd7Sp4aHe1TSltYfgjT66lJ1oemBPLr/WK+9XPvznqkBA2zz9Du6sSkujx+DGUPh7lL1K7onawU9s/WG/tyNBQT6Yaxa96RxWTnaFH+yfuFtrIGQAJ8E4PlrfCLlDD/ei8TJpaOf+H64komTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4KlZuEZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4KlZuEZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso2456418a91.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788385134; x=1788989934; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=E4KlZuEZkT1KfbSLisjkwWi7JEyEk+K4nuog4aSXS81zzVZ0fDTb70pmhzTV16XguG
         u8gJQ3SK+eRAgtdnPUgsTRLSbfBFcASfF2WnZHNySEc+LXmhLsxEobCQnlraPc3a4Jkm
         pFl+bL+ET0fnD9U32EYde24Lc4HAu+YNaBzhpBJCcB+Z4TfeZYW1JV+GJYUhu76blfuX
         KFwzMhsczPUeXMy0OxpbreRsW3y9gjVbsaaRevYo41cjC5ypnWVBToEQA90PDKAcjsXX
         CcvNIaLG8RJ/de483JaYnQbEYPtiNDs2HMWPzKHQgXHbbDO8Xin16/4+4jjMRJhRXPsm
         4zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788385134; x=1788989934;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51ibZFOFagQ+E9ZIDyF6lkMloDUoQoVNjs4ypi5okac=;
        b=HmhefQczTE0cZNQYjwqcauhHrPFSiFfEdrSENaWz8N/8kqXVfrPMAMaHhSu3krFY7B
         etiF8v1fyUnnab44bHSNFTyxqIiz3U+Tnqi7LFB3oQ1cIV08Mko0lrY9P73VsHv+4ap/
         o7pH+5CMDKE9DxxZSNo1cnA94NP92mLNzfg8N+n4jXRtHFZMvb0sXhjkEIhjZvSL1uQW
         QsxEZ+lb+nKlo0Dzg6PRzBRwD8nQmT+pEjWkutINDJ9NG9SaVscLeMw0GsEGUQlodgIn
         /8fD1SPi5oOtxJeFunesWo3QxlMCzTJwL1Swb31qpKHiKGmMFCw+o8j40oXOUvgZpihy
         nKfw==
X-Forwarded-Encrypted: i=1; AKwUvBzmUeFqSrScssBTbbAW1EU5jxwh6wRwI20d/BRuixZ06PDLj8y9ODJs9fyhwy+2jxZQVcItgVuBIjE=@vger.kernel.org
X-Gm-Message-State: AFuF++lSRQjjZpHG2lzOPv86FIVgVlGzrE+osu1kpDzGiSI273Xf0YoO
	u6MdhRXkK7j7lkKumHtwOk4YM2KbHF0S/qTAEHBvQ6v4TMXIYDhWRftI
X-Gm-Gg: AYBFou0M3m/34YpHLnl3HM5FhOKPk4MXtvvA7PwCOj3IhR+cuxR9iE6xEe/2+S7PiPq
	JnaFHHAaTzfevZespgaclRcVTHz7AvykBWKRF3kwZIrHx7njZ3kVI3BmnGXHNap1evAJnxE7iZr
	QlTCE431fj9/GwE2junBZSVrsjSgTl6+1IvRMsKMgy806o0iFJf2odpha1pH0N/nsy9LUttDzQ0
	O2x5dHXCm7BdbtWfLrHPiuYpRghDh+PCSF++N3YhbousVfSrmISiEu8dHPmG6nj9y822D5r46Ra
	bslkZfYJrnZQbwTfegXb2VV5D50h6n/y8CTujAk+Fy7QYFoj9oUCNEjet/4byac0jLYqlYjCJRW
	g/o8zjO64/FmwlCrf6a2Vba73pQQLA7BskZal/jqnW00SF6xyDuPSvHX8DmBTiQaYorleirFkXX
	vZgd3HQ2rLepfTqGYZaNQcdBbuNHT/vxS6o90tlw5yJcTU+dCCUO5ZJO2dUI7xvRnHkLdw1Y0Sj
	g==
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr12990696a91.8.1788385133676;
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm1358930a91.14.2026.09.02.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 14:38:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Sep 2026 14:38:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/tps53679) Add support for TPS53622 and
 TPS53659
Message-ID: <56544fb0-55af-4e1e-83a6-73107bc152ab@roeck-us.net>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-3-sanman.pradhan@hpe.com>

On Tue, Sep 01, 2026 at 09:11:53PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS53622 and TPS53659 are dual-channel D-CAP+ step-down controllers that
> use the VID VOUT format and VOUT_MODE identification like the existing
> TPS53679/TPS53688, so they reuse tps53679_identify().
> 
> Shorten the Kconfig prompt to the family name and list the supported
> chips in the help text instead; this also adds TPS53685, which is already
> supported by the driver but was missing from the list. Update the driver
> documentation, including the per-attribute lists, and fix an existing
> "TPS53588" typo (should be TPS53688) in those lists.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
