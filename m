Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0A439005
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986563; cv=none; b=bpHAKgO/mVHcg9u5qnow1Gk+9cNd4otSZ0aOxvOpUzBAR1G4GRnNGE1C5kRBLwVZGbs8yqZk+6pvkzTylEhJZbh9pXV0x6CAQOiTMyUuTZ/A4xSg4UL0mYfGQOj/nc1YLsC7qjvxSy8gcnLu66dZjWsQ7XCHXd7HHVfVmlNJD4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986563; c=relaxed/simple;
	bh=h3BC5YMghxOhOhdCiwgnhzBv6w4kP1j8PYmvyHASdqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSB78r+eXGci2FDGNS3KVh/8wWX3shfFRvNMAzj75YOLShB0Uq0e9mfNXwtnrIOD7okSZUJ8uPqQJnMuPKVqApDonx9LiynY0GvM8jAztPItVkQQjg09DVoVN1J+qD9OBDzS2hZJbxEUj87+AmgUls51Kqa10yFYVTKoquSpNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dnbjjc1z; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dnbjjc1z"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so6603403eec.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 06:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986561; x=1778591361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRzOz7rsFwOGoFl5LB+6NCCOsaP7tXP4lDMDYY3QNz8=;
        b=Dnbjjc1z2Jp12Zg30tEqK+3Nu8J6P+EJ8BlznfBpT0Kpd5zJsgh4NKC3jNHQH3uNOz
         Ulhno5nBzQbBtiARaDb2bTjzsnERvFHpOaOXcdfROvxRdwo476anlkTVgRjsV3/eh+cf
         2ohoIscLkkk6Glznq+FeRFH6QfJOwF8Y4o5ADYWRyJVNO9W2i9dbicyF3Iom3YYY0cJy
         NxshQ1U6Vb+ksEEGHpAEtUnaedaX2PVtIi4wWQtIWwtjZT/aqXHYS6xCKz8Jkknttq4M
         GEK0imPafuUN1olFXebdE0atYcKHUOuGUSy7Pg66tMNMcuLvfe3kp5kR+zV3/AVpJv0/
         M/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986561; x=1778591361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vRzOz7rsFwOGoFl5LB+6NCCOsaP7tXP4lDMDYY3QNz8=;
        b=ARz/sWxSZ+AIibhLh3jBvq3k8eSkkBA6qesKJkx+EykrrzraOYvnfvTccCrK3k51LA
         +FRUIuzPlpf/1EX9eC5nlYSNiTX3kDqBUp7/ahXKKoAfrtIyJCfDKBtWejYtj9W0PHGJ
         mR1WDO2ilomof0loqOlY0L0bIZY24wT7k4kuY9xMbGXl/gnj1dnN9clQkESepjnIu4N+
         jrfTWzXfPomzEizkJ4WUcsiriq3qKSFKPRn6+htRm1qcSaTXLH2+hpq//74hUtVL9st/
         RjtrjZH2iDQJz6ydTLlCiBm8i6hq7OIs+v3FA8/jGLy4uqKVpuSSqD8zUq2IFo+QDe4N
         lgJA==
X-Forwarded-Encrypted: i=1; AFNElJ92rq1n8tgCjgIxvLwsvCrHMEffoXivFy8rHBv9DhI/P0WVBZrdSlD4K9QIRCyfXF1ffaXxYDHP2nM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzITmBysjPSTYGPcQVmK+OksQcySe7eIrHHRw2FY6yOH0QLDFi3
	cMsYsE005iDs3IO7MvzJeMF3LRul5HN6e+yhxNltGXaGvg5u/62zwbXA
X-Gm-Gg: AeBDiesrwZvlC3xTIc7ywzDuYXKzGB8iaXJB+Iv49Und683DdXmuP4RqxDPJAMvl9mV
	r10hpVsEMsMKrfK9UyBzmlzwExLFhAumqoPpj7iis6wJD8tHA9AUwGES6SCQSgOJlURmvCy9qMp
	m8AAxuxzmoLZSfapukePQsL5BY72ZxDtbbqcU3v6HRHBUaMzGY92+FxSJRBUiaveukJM5B3771K
	SeN/bYUokbNYcxfip3Tv/n86t2B4VN3sqMlY+fv6LsBCZh2Vz5snuYKkCo/WjDMnqWtqQAY6SIZ
	rH7V/HB4GLvjlVJJ7kFW3auPKjVgQ8Y30SKmfQUpYxqrhK8SHWT2uhccPPg5NOF70VaBhaq4cbl
	Te4hhUdDCRir3fg3CpLng+HE7/ru2wzHIHztR7AUMkO/y9VE139xBG8BKoXciwWQXnTPfk1DlJZ
	paQAly6Z9IrjGs4yr+eDZRZqHtpDN9oLgQlnUVAWfkePyC/HM=
X-Received: by 2002:a05:7300:6d06:b0:2c5:50fe:c78f with SMTP id 5a478bee46e88-2f40841d665mr1356830eec.12.1777986560353;
        Tue, 05 May 2026 06:09:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889cf53sm26489351eec.5.2026.05.05.06.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:09:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:09:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Philipp Hahn <p.hahn@avm.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Hahn <phahn-oss@avm.de>, linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] watchdog: Move `struct` before name
Message-ID: <accb7a0c-3969-499c-8a80-f39cb9573d33@roeck-us.net>
References: <cover.1777972790.git.phahn-oss@avm.de>
 <e66ec58f3b8252b3676cc9fe68818af95123210c.1777972790.git.phahn-oss@avm.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e66ec58f3b8252b3676cc9fe68818af95123210c.1777972790.git.phahn-oss@avm.de>

On Tue, May 05, 2026 at 11:26:13AM +0200, Philipp Hahn wrote:
> From: Philipp Hahn <phahn-oss@avm.de>
> 
> Write `struct ` before the structure name as Sphinx otherwise uses the
> following word after it. See
> https://docs.kernel.org/watchdog/watchdog-api.html#environmental-monitoring
> 
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

Applied to my watchdog-next branch.

Thanks,
Guenter
