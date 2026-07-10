Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C38426ED1
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695034; cv=none; b=rmBCo1xGGKm/tv2/eadcCUW55u+xnCkTSEpEjwuq5Vqc3TuagrToTd91VTC3QEKn5EpcI3EB43s1xXjcbbFTIVsf/cFa4a6P06VnqM3yeXsd6czsae2cq4Pio58KIdrCU06j5JII7TBk1+QluxCk1y+8dds0h7w3pfG7VNPHazk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695034; c=relaxed/simple;
	bh=/GyHDtjvQFjedcHXEDvC6MFal4jcf5suG+7c951oMVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhLj9ARzJLogdhzUa2xBIF5sYiU1GVCispKbu3CCZL0jS5/T6ym5gDjbxa/IyJcvlD4e2QLFhdGWqNCdVuUyxDSJa20lNt8MswzJh5/67zDLXP1W+cCTuxLPqmcWG255RdMDTjh66/a+vgIdRYy+41t5At/DOKPhzVpKPG7aFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6z2sEVL; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6z2sEVL"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ee88fce572so11043116d6.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783695030; x=1784299830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/wMIQHIqvpGohrBw2k+kM7bf7+q0a6yUHFC4gdhlqoU=;
        b=c6z2sEVLvXQ5FldpcqkA+YK++HafQimpA2c3aw5YXwQo9l9ui55P0vXVaOYXg/hl8v
         tjO9t1rdRoBPnZ/S+wMctR6OTYbScx/88SBbwySiBoO2VZGwV5BlCvZMzl6G1JaadLIB
         FYUbJb4p1uotatAFaKwzwH4TJbVFmioOGZzeArzqoXJw8la216qZBKwrdKHCgzYSdKbu
         7zsazEYFlWlAWkkOtYQS04V5TrBYxk3GIT6GxA7tFl5cwQRxG2dchIA5IXBA/p7OpVoZ
         zVFr5dGvy09HUW5+c6UwFTA/gdwBJDW5Q+wAIfAe+lGl36bUgjpMyzJ70MMQCLqvhlQx
         Kj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783695030; x=1784299830;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wMIQHIqvpGohrBw2k+kM7bf7+q0a6yUHFC4gdhlqoU=;
        b=WtyZE+0yN+YnfeCOqexyqY5Mp+s27AzkuPeRpkIXqOHxVIJr/7f1ODN9X3sc/TxO12
         1vB0otmg2EoeweoSzzsd+l+F2o58aew0GcADUExlBEqttiqzE8pEYwqR8eSEFLXJQcKr
         zb1ysiuFe+l7fMN123QCangRN47onviyLu8hoSMHCFzv59HYSKlH6c5In88Pl0SD4XDK
         +PDX9WbhJLQQs+rrqVUKtFBLnTMk2QYmafbGIX5iUv44n0PLrCFwHCvpyBABpNnGETyn
         CCVeUZvVirLnoX2uWs39YC/04RcoeqYiKO3W8GuLGcdR5RHQ6WuJ+JWqmqK8JtYT5pZk
         2ZbA==
X-Forwarded-Encrypted: i=1; AHgh+RozDPLgC8ny+icSuJiymz/A+so25lbHHpDFnPYHOLkUpaBPjwhTyWM38qvdg3wynH73U6vp7Vielpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQneOA2vg2GeS+SvENaSZepSK+ydJ1w5V3DUXGuR+SClRyFhIX
	cAlMAtCsDoGzq8G5vQaL3zgWC87iGlNjXoYR+/SeqVOFJ9LF2McDgTtN
X-Gm-Gg: AfdE7cmKu/YxlC5M+wx8N8EadxgyGu5W9Z9zK2h7mXLexZ4ZWvykd+BuUx2Unu0ORuj
	Zi6aoKfOVdFhqB47Tiif7ypl/TPLaTwclsNviqATqRXgwhOxW8S4vmJLRUa/8QvNK80U4OXHhGE
	9nIfkyw6GkaLrquk23s6roNfKuBWFNmFMI6VaNn3OIURFYhMsAdirMFg26ZQXBAio4Kzcodfm07
	g4vY7YWUWfTcVjAYCFuVnErJXEEi9ulRt/AG5+11Q8FRybwK/n8a5qC4/7awnVHROtr39DuCKTx
	ic3YJDRzIzMz7lFbMozoacZ3h1vsCp0ncuyDVyp2uv+49bOay24w15ML+PyWgpu2Rd4SHTE8j5r
	MQ1wGmxLPVA9OvpWcXBc/DUaHBQ1nMOO6UHniZlKPPL64nNHTjbN0FrHrh7KZke0Bdl+yAT0HIo
	Vdv3GOZhUDHYGd6C76AsoFKHOx0g==
X-Received: by 2002:a05:6214:590c:b0:8f1:ae38:1beb with SMTP id 6a1803df08f44-8fec2276b3cmr143145796d6.32.1783695030456;
        Fri, 10 Jul 2026 07:50:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd492sm44739756d6.34.2026.07.10.07.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 07:50:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Jul 2026 07:50:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus_ec_sensors) add ProArt Z690-CREATOR WIFI
Message-ID: <4eeff1a6-2b92-4af8-864a-ca9eff3f23d5@roeck-us.net>
References: <20260708195638.1324168-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708195638.1324168-1-eugene.shalygin@gmail.com>

On Wed, Jul 08, 2026 at 09:56:26PM +0200, Eugene Shalygin wrote:
> From: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
> 
> Add support for the ProArt Z690-CREATOR WIFI board
> 
> Signed-off-by: Maurice Mehlhaff <maurice.mehlhaff@gmx.de>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
