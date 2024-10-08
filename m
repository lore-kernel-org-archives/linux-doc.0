Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515941DE886
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391481; cv=none; b=RFsBX25vFuq/1UuGYDWturvWxgwcOKcWw0KVIqcDljO8QCQ7TVef1k5wDWeU8tUDg3raoVt6zrGe/79CVdRjVjjNDNofIdhy/M6tHXkTbDwJXU++/v9JyO1hgsldxT1xBWPZs/zm91erEzkQq7SWDtnymljdev2UCfHQKFLnlGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391481; c=relaxed/simple;
	bh=qSOpSf+YsWDnlVAfQYKdd58y+jL1GlvU2G/SV+Dza6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PKRUmDub+OTEZ9hseEMfyqXSI+UfsLxQmPRr/fusX1YX1eJFZoo7cqwIqtT42QIgpV3yUSUGY3HxQyh7PhxLLNFUCK/wQaZiiWYBHIFa4RkHlzLBKsHzQ1W06rWF5cjZCpNR+VXg1X1XiQJYVWVCaZsyKBCEf3URGTNvjfPlv24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p/CjKDDQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p/CjKDDQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so52147015e9.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728391478; x=1728996278; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7e4/3Ls3/aNu9dK/eI4vdsZOolZWQW7jGRlN4Q4ST1w=;
        b=p/CjKDDQffUUZoawcEzetWTaqM9zwFMqgqhg3QQbM8WqZH1OED1VwkDrgBXHSuyfWK
         OHpAUVMMSWm4gakTI9ncUIpcqxqqf3x16mKiTdtmcsKjE7EXKeHBZVRqftJ5aZ3otnJ0
         0ZRNnjoulywrSfykMvu24zs5AlS78MNCbqoHdOxS/ho/R8VDxoOniDSa/2+A9z6jCxIO
         OFogICgAPWNJRZqpiL8HFPDgFZc7j2SELAOBf4sNANiJN8mAXDLlNptN5mPCc+j+BNTK
         Co5ReAEwlsGqWmCDYkZUNgwf0yBAr62sw0FDEU1AgJFGE4dtDqr1FY1sbYxWNmP88CT5
         +9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728391478; x=1728996278;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7e4/3Ls3/aNu9dK/eI4vdsZOolZWQW7jGRlN4Q4ST1w=;
        b=mkVBHwSrDipCfGsZJaiYtAA9EyVxhN7BW3lKPp+/CnWau1o9KbashYmsAHNmPinKb7
         gD4DyB+ccGTWpidZPAOagCbm23lHW6xc2XTvZhQl4Djp9gdowzSvqxMXdji44inJo8Sc
         +pvhOkRfaz6aRmzJiUPMnCaQoXr99wBftYXni1rtPOwQZjtCgjyBeuOVGLKPzQ7tb0qg
         yKHmCnsXjH2Jj1xJLTbOCVr0ny1SMyjyObIEjbEy0T2qLZOWJKsYRHygkkTlR/d7gg6n
         P+1QxoIdgTpStd2nGZuPSozaMSnkNPZ5T2aIEbFh1maKp+5fGDAPY2MHLzRyrXU0/C1+
         QQYA==
X-Forwarded-Encrypted: i=1; AJvYcCVPwtf2ANHJIhy2FSjvUk1pzP4ROGPOzmfjeqcgPRx7zEfneC9xXZRrGf7WgY+oOTXeY6i0lOZEG1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNzYCpNKAqNwd9zZSJ+IALO5n1wHT8shbXtSILjB1iSbU/DD00
	Px6WsS25GllyFEc4TBjZacsBHeKnwVPPukR6d8vEoIzutdbhPwj6II1/J4xHWPU=
X-Google-Smtp-Source: AGHT+IEsuASKpxtLN1FS9/ppE/nSGh27N+1yhlWxNalTb7cFM5CXlhMi6qIJJ4CYFTRupQZK+UJsOQ==
X-Received: by 2002:a05:600c:1907:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-42f85af89ebmr118622545e9.31.1728391477489;
        Tue, 08 Oct 2024 05:44:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:41f2:4244:ce34:c273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e832fesm109260625e9.8.2024.10.08.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:44:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Brown <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,
  Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  linux-kernel@vger.kernel.org,  linux-hwmon@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (pmbus/core) improve handling of write
 protected regulators
In-Reply-To: <64c3f6c3-10b5-44c6-a1cd-c796b770c904@roeck-us.net> (Guenter
	Roeck's message of "Mon, 23 Sep 2024 09:44:11 -0700")
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
	<20240920-pmbus-wp-v1-4-d679ef31c483@baylibre.com>
	<ZvFrWDF6Pn9zOb23@finisterre.sirena.org.uk>
	<64c3f6c3-10b5-44c6-a1cd-c796b770c904@roeck-us.net>
Date: Tue, 08 Oct 2024 14:44:35 +0200
Message-ID: <1j5xq2sr0s.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 23 Sep 2024 at 09:44, Guenter Roeck <linux@roeck-us.net> wrote:

> On 9/23/24 06:21, Mark Brown wrote:
>> On Fri, Sep 20, 2024 at 06:47:05PM +0200, Jerome Brunet wrote:
>> 
>>> +int pmbus_regulator_init_cb(struct regulator_dev *rdev,
>>> +			    struct regulator_config *config)
>>> +{
>>> +	struct pmbus_data *data = config->driver_data;
>>> +	struct regulation_constraints *constraints = rdev->constraints;
>>> +
>>> +	if (data->flags & PMBUS_OP_PROTECTED)
>>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;
>>> +
>>> +	if (data->flags & PMBUS_VOUT_PROTECTED)
>>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_VOLTAGE;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(pmbus_regulator_init_cb, PMBUS);
>> I'm fairly comfortable with this from a regulator point of view, modulo
>> the suggestion I posted in the other message about registering separate
>> ops.  The fact that there's three combinations of ops is annoying but
>> doesn't feel too bad, though I didn't actually write it out so perhaps
>> it looks horrible.  In general removing permissions is safe, and without
>> separate steps to remove write protect (which I see in your patch 5) the
>> writes wouldn't actually work anyway.
>
>
> I still consider the callback to be unnecessary, but I don't really have time
> to implement a better solution myself. If you accept the regulator patches,
> I'll have another look at the series as-is.

I'll group the regulator patches and resend to Mark, adjusted as
requested.

Guenter, should I the resend the hwmon patches here grouped with the
tps25990 series ? Or is there something you'd like me change before ?

>
> Guenter

-- 
Jerome
