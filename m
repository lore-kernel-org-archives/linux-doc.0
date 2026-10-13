Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B183349CFF
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 01:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853795; cv=pass; b=p310uNGLwiXWdXuz02hnDZ1iGrpkNq6wICweYE84HePuPSvQUcQUrbhKJGdhubl1rnV871PpS8EUsI1va8QtQvdfF+MZCPmI0oDLRgyQE4kNgL/E8XO83M7u9BHVLLy2oC5blKWcKD2Z62br+VIfopuaM4ywKvtUWDDq7iI5S2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853795; c=relaxed/simple;
	bh=9RL00LFHIIO88+jXzVKLvob0h2mVaGF8QI8DB6z0krg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAUI4WNxA8uFVeyoaFG3g0YGksWsr2hYNd/BGq7OZIA6l4eyCxLVFANO9faEa2OKptsFJDO5exqmotCWm4JHSlolQBo0uEe7JsKzht9l5cAqESHUbD2qfIzxC48zSLJG0O9jzsrdNApzl8/FIHWUbqWZ0kEjHhP4V0Gbz02dOb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQOTwTqE; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQOTwTqE"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcdab9a82bso2682572e87.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791853791; cv=none;
        d=google.com; s=arc-20260327;
        b=QSyC/IJb78jEpR9Zb7xwreaIw3PFbCWvwwORvEp6I9Fkska99KkckGYB5yHQUPCS2X
         Ir58OXsImsreTYYldhhd4xCqcllpDVuUeCMEPkdN4U5rGZbFS9MfkZzD620GBvzjkE3a
         Wgab+L7tXyo6xLMJ3socCmcwbujuWLzx3+l1vga+jZOcyKDBMUaVpzeiSlMJUckhekLk
         etc3UyUVYhechi1N31iPs2sP84jq4v2CweHrYcnHhRuPCyeetCYnRWtIV/yhvNry+y/1
         en+ht8bvG6ACNaxWLrb6vWbjIJN466QhpfunBk8BV68wzGw9NoeHzXULvsjwOctZmyIU
         tdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        fh=xTaCnu7znpumu3O2ak/qSd+afvOdJzzBBvxX9vI5KxU=;
        b=jzHsKlaik78gPZfhgF2d3gOQ3M+wCjMo0EfVHQrpVHKDOQGMtE8jOtol1QC2r1PqvM
         iK0KySC4WRSUICNwGu7LhOlP8577XBi+6M9RkiEuA9xlmUzyFeES+6Je/23Gkgu+ddwQ
         bwiuunjRSkWXyLon4V4tXJ+QOvz+hgfspDiiNEGsV9Z1t6YZTQDznYF2QAB+CPPTMpdT
         h+IBDQL8JR5/K6rFoPWT4ejBX+IvMesx+tUh3IiWVSat0DbTECuPvlRo7meYxit5jDC7
         7RYXIHCpS0ImLHd1gJJPYfl3vEt13rIyguA8dc6bTiIO0ZJNaGA/cgXRGDcO/SpUIBUV
         g9Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791853791; x=1792458591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        b=dQOTwTqExyNKKch7YjKQOp9E9MzhdR+3GhRer/NZ9cRSjX7xxnsBl58CKBtoZ8ddF9
         Y/ukWR1fNpkqoclRtwCu5kqq7+J8Cgds9/wB6QdTmNOfucgG6mPuEkc+Cl/5viaEteqH
         sGhJxmD+c5EATWoc7y9xX41BIYTZEY6Hvg4oPXPMqFrwKh1F8UucqXZCFFqZxEcl5lfS
         1CboB4srDfiGcO4ZIUJ8mtg8jNvJrIXDJgp7CUdJxWDRK27Bpg2yhf6fjrtBeS1sbqXX
         4xzNmnD2Wo5AddFmYdTBTPJX9N/qaW/GEnEaBDscLdnoWf5mMCfu89sjuworlqp4kTRk
         QixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853791; x=1792458591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TQWCS2dkzE8iTKDMzcf15gZGdS0SUXomK1lT+byEss8=;
        b=R2tALqkHO0rzhVbvp5kdzNSM09D4e9DmhA5GDGf5E4bI60L14oV1oDX2RBhE8TpyuJ
         njvoWQjJynOGfOWjitb9dv7kjBHJHRxILmnjWMMNJ85Kqoojf3q5aqXGTnYUlhVCuFyg
         nJBRlA4Clll8T+VBqlnhZcoJps9zI1+yguaANAgvCSdKiTp5KK97iZy3Y6XaADGIvvxH
         QGgE3ySSDvIZ3ny4tWtp5qxv71xJF0po8rW1hEyZtAbBrr7lv+xs+bRC/LAmZoOm3cBs
         IMJuhP72VN8R/4ep7QEevhzRZ679dAFi+wFsKPHR0TOXPwGj87pojeBgFBt61NmPjrn/
         ApQw==
X-Forwarded-Encrypted: i=1; AKwUvBxnSXglXPWngGIEBViYauZduK6jkWQ349vXSNNLSc73uhpLkVtvXzhqMt57AONfBfrwPVh6yC57X1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuqCcfbd5LAGq1nd+yYS5vDoBseJxmeBMugYdo7XUgYAIFuHWK
	nKiysU+cfQnKUGtxT6b73s7RImXRIgWLerwL1mG+hMcEZOGmdLu3lznYNXq2unkzpcNh8R0qOi9
	nsTcH1k4tx6z/m1JKrhE2bGYQQQJy7K0=
X-Gm-Gg: AYBFou347+u50Zi+j8Tt7Y50ZRdfO29ioAFzJWPPMDXXhu+/wYZLFFsgDYaRzoNGLp8
	NfhzF6zrig+TVnToMFZlO4tPD7m31QBUyfGOMsEi+FcCmIc+vVppOgMhOTdTIkmMz0ADR7oLZJe
	rhNrldR9Op0dPOMQRRbAqcszcUHAQILUJa79pQ7Jg8XCD4MJ1eMelEKA4q0MfLn2Bnx8/hy2lzn
	TcGliGW9PzYM4wJo+khch5/HOQTPq9/3oqw5brxePjdLoEu7X8E5cdBQ6RQ6BFtlJTEDNCN7SCh
	p0LoJohWah/ha73yEKgRlEt9n0aq+DLvoxfKUvxmaEEW5PMImvyqGYkDJidU+w7hQNNgMO4kVpR
	kg7fRjVWIj7/C9jJTD25OeWOkRvgrmjpbmusEVkVNGRhmly9bv5qDpnpqrZrPsGL0BYk61g==
X-Received: by 2002:a05:6512:3d8a:b0:5b8:bc5e:b58b with SMTP id
 2adb3069b0e04-5bcde8e872amr3334571e87.67.1791853790708; Mon, 12 Oct 2026
 18:09:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012230527.750567-1-aaupov@fb.com> <20261012230527.750567-5-aaupov@fb.com>
In-Reply-To: <20261012230527.750567-5-aaupov@fb.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 22:09:35 -0300
X-Gm-Features: AclHuK90-dNnoxwZ9xm_7cAhII9ZWo6vVER80Mmoo8VfMl8VsyHGM5XUC-R765U
Message-ID: <CAMAsx6cvv6XZY=LdayuEvBAXV3NN09Ru0KCcdaufscCtMeXoJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] coresight: Add pmu_pulse/extout_pulse
To: Amir Ayupov <aaupov@fb.com>
Cc: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 12, 2026 at 04:05:23PM -0700, Amir Ayupov wrote:
[...]
> +  perf record -T \
> +    -e cs_etm/pmu_pulse,aux-action=start-paused,timestamp/u \
> +    -e armv8_pmuv3_0/cpu_cycles,aux-action=resume,period=1050031/u \
> +    -e armv8_pmuv3_0/trcextout1,aux-action=pause,period=1000,call-graph=fp/u \
> +    -- ./workload

The CPU PMU name depends on the system: armv8_pmuv3_0 is what ACPI
systems get, while on devicetree systems it comes from the compatible
string, e.g. armv8_pmuv3 or armv8_cortex_a76. Maybe add a sentence
after the example, along the lines of:

  The CPU PMU name depends on the system; the available PMUs are
  listed under /sys/bus/event_source/devices/.

I applied the documentation hunks and built htmldocs, no new warnings.
With or without the above, for the documentation part:

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
