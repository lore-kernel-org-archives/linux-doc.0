Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22E1917CD
	for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2026 00:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603552; cv=none; b=s29ACk5KSoQMJrzfiXWaDmNeGuy447Z0wQRCtxOUFwaGl9J5/HKRQ6KlHQ/PaqJNsKqXbhUpK+gJ/NonEY6x5bqhEt1XuiQFvBAXWz0C3O7V0GiNChJR1k4sNc8Y8BPmfDDyXYXRvShaHiC3n4HGhpF+2jKu+uOpf0UKQcyqI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603552; c=relaxed/simple;
	bh=YfBWQIfeWmSq4z4LF/oUiBx8g/eXxpGJ0xbwZkgPHfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQsfnOtmko272cxJ5bMW8ojdVfKbpAwkj+PbJcGByQwiQr7B+yXc0o+cKN5oF3x4STBI0DALLRnOklvhI/LzTuxNoF4WMKCeXlQqIeDs+FWKTggYrn8sJyzas2Dszx2681h0PhXPumUnxFgeHHubHpfqiCQ595GJul7oezkIkug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDvGRhQn; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDvGRhQn"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6c72bd8a017so140897eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 17:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789603549; x=1790208349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kBJXze/m9QmJZA93LQC5bmBZ9qB9hQQMsHhryNrPRAM=;
        b=LDvGRhQn3VgrlTn/7I9Mp8PPtXW3tyO2yjU+zXNyOqfvmFjOsYcLsQaA71QBCORvlr
         OYALoQiL2dYZBd1FoZb75vl3IfSH6vZ11q4k5NPKgbsI+JcsaAVeb1uetQDhIB65mHHl
         zUlnNDW//JAxh0xacaCDz0rTFbYS6MH59qvacfr+72k5/rFR7r0HQHfF78oxMp6CNylN
         9ZjDUWpFj1YBw8JfqnTELXUZQ9sZFCMfJLJ7kgJjy/Wd4OjsCx4Os+FeM4Nfw/fzY042
         5ANZ/W6sxwywd2E1l7KGuX/Uyp6M+l4UlkgCjWECbyKfpBxtvDyDzCQ2xTH5c9j66TvR
         sfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789603549; x=1790208349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBJXze/m9QmJZA93LQC5bmBZ9qB9hQQMsHhryNrPRAM=;
        b=CgpPPP2L+5v06VpzVn13UEoGGW9wP85t60x1D9+Hv/xCsHgHHJ6vegH+aeYnmiUFzX
         HSSrv+I5kaiuQ2L/gfZWq5UJnQuycgj+DmbFI8dseLzxAHVOBGS5xKR8mr5xgFb7Qqq+
         CyuU1Sucr69eT9e931Gbd/zdcyFhnKhzZDBFQnvz88FT+OHZihQhmiy73jr0uozLy9lO
         jGGxiCupPltMzBbfwndJxMQv0w2V0UcBtNsNqkETwqNqgoIl9VK4i1dohVzvX88Gh4+w
         6wPKCM+/DI1GeIA+fKZ5OGvBo/47lWU4ZBiq4hbo36oJiX/wxc/88ZDExc17ci97QPR7
         EOGg==
X-Forwarded-Encrypted: i=1; AKwUvByOhpIJr+lcWA5w2TP1Ucx3k50oK2rals9k6B79wQxaFkGbh/hpzsB7Px7kCyBS7vyxwVK/fB+PgHk=@vger.kernel.org
X-Gm-Message-State: AFuF++mxEZSTYJp0Vm/S034eKICCRaSprbvDZ63RbQp1GmAUC+1Wd2Rh
	6Pqt9HAD3hfw2Qvl+UBIbEPNNlqbvdDmODLVndNv9WDC+qj9DIEiNipqwngkdBE9
X-Gm-Gg: AYBFou3CsanZn8dvpp+mbwkXvvai5HqVSSum2jNTbWeTuHywtB8ESex3mrQCxHTTCpG
	m9ZrT+aCVs01W0exM9fe3Cysb4fG67ixrrqpMySaOSpHjE1WSWkqMC9WIC+PYwznft1CpqiPIRP
	Qhmkmqdoag6Dc36zB7PIHp0RryAqWgUidRszuM/+9RemBDSei7eu/13hg68kg/1VnxAXGgJ3QY8
	Hi7cRUgb8vbQsECVCrv9jwtd38Leg5jM1kDIgQoScKLCIQU8LG595eREhoeWosW0lhYl9NseTDT
	DQp33Z9gxPZLZTvBPqSb9vMi+nDh143BufvuuGtxf6wk72L06V4jhXdYnfYcKMPLNwjshLoz06N
	MA5H45HfQ2EZyu7BReofFz5q6Aa8IPBAsO/P5Do/CfD2ldk6LlIvjoIj1aF1+1JXac3/mrGZB65
	I1dX93npUDbuoJVMhdwN76eUBRCI/8m9/qArv57ctb9LdEdfIZWIo+MjGzmt8InojL2pyZ+kdwP
	r5THPNYAjZu
X-Received: by 2002:a05:6820:3098:b0:6ba:3635:7ffd with SMTP id 006d021491bc7-6c7d46e698fmr4348329eaf.64.1789603549061;
        Wed, 16 Sep 2026 17:05:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d771e5sm9349126c88.15.2026.09.16.17.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 17:05:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 17:05:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/tps53679) Select page 0 for
 single-page TPS53676
Message-ID: <54991706-16c7-4033-ab8f-6ee1149d1702@roeck-us.net>
References: <20260916235406.681131-1-sanman.pradhan@hpe.com>
 <20260916235406.681131-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916235406.681131-2-sanman.pradhan@hpe.com>

On Wed, Sep 16, 2026 at 11:54:17PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> tps53676_identify() derives the number of PMBus pages but does not
> ensure that page 0 is selected for single-page configurations.
> pmbus_set_page() does not update the PAGE register when info->pages is
> 1, so if boot firmware leaves PAGE set to another value subsequent
> register accesses may target the wrong page.
> 
> For single-page devices, select page 0 explicitly.
> 
> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
