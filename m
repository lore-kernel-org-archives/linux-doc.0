Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF062EACEF
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 23:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771715002; cv=none; b=gVppQwiGrdj4qHS05D6YN7m1UCWx+xWREHF1VWrvU3Yi6KPqe2K8ye0iSRx3NQpkeQqWy6aDlGRkmWeiZs33XXunPKXExrEyWrlA6V2o6UKCSYgP7s17EKUblRdPJ8Elx0so4eHDmfPF+53FW/VezKcrI1vxDwtEnJE614YEZh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771715002; c=relaxed/simple;
	bh=WF6K8NVh78uZPufRZQJLFh1huKuqJ4ocCD0xUfY4M3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsllAvm4b7Ip82U2FDER3XnXobBpKXTkVHQbPNLCNSePxO4+JfCNMKh3ZwPZhlLkMLhgUfwGJithA69YnNKZ8PKq+XDvifWreB0UOWykGMSe9r8NsIc6/e3nozlztcoqPGEj86qHUbI3hkk8vrfp+1akbff0KpZpT9yWt/jhPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJ5fwAJe; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJ5fwAJe"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-124a635476fso3060399c88.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 15:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771715001; x=1772319801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OlC2BNJohPSmbVkhvbzP8ZA/FR5DuvPVsmBlsvqYtc=;
        b=JJ5fwAJeXGGv4ZQBgRM+xw7LJWLoHuRWkzmQ1Y5F4SJvzdo8oGv1D12XzTuR0nhK+J
         V6+duLXFS6d8Wyyg6k4se/9zkgpNOSHm3zqX/PP7MU7Oli1uk9BPKZx2cyXofqJR3e0o
         MTXhK8FUZn1YclSkI/4LE5W/IIdc49qHVp8dadIeu6K0v8rV0oogMFjpf8WCe7GFMgLf
         KLEs+qjTV8jyavJwwX5qu0GFAn8y7v+zUnoaMu46KcRRNOWepP+Q+eyZHCidjjzTI0p2
         x5A7Ohe9JDimkSNJSrrYQZd9u9DaxJdcShas0fx6tZsAbn5di+Jum7zc12IJffxUsvqO
         WXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771715001; x=1772319801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1OlC2BNJohPSmbVkhvbzP8ZA/FR5DuvPVsmBlsvqYtc=;
        b=lcwE3achRVlEetzYHS0wovgE3+5EkXgks80B6MlH1wFCptTUmVxdCW64LyhrXCFWaY
         WDw8K4moztCxWFS17K662gk/Gw9/6UUnt2Df4EeLAmc1AWSw//ANHrYEr8irf8JnKSCy
         RE73wykv8lilgbCneWQt7XKYIcvwbN8gPhz15pCptw1ulZVAXXaoRnYuad/bZXiO05Ig
         uDCIrdY91U2L65ti1bN5RG/2WoDHEDOwg/bvYkPgGcSIuj149m1HqO1JQIgvjGYfkXkG
         7HLfdezDWWkWh+IQiWgk7GZ4splq8PTdoJzB1aRVWpqsTzR1cdFFU7qKH+w9QmcnYHpg
         m7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU0CODmlQugcIyQ5MytA5I7mVPDQNcgbKZ8ZQsA51fNMqcIbmstRQyBZC19clDjx4lWkPwdKGQs6Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlWJfcti0fpZS+Hgxv694/0bo24kQ/gI+aGsEP03oVpby0FhR/
	g54w/r3+LJmVFtC4wBAlYo+umEhSp9/lw9ttNys0QrpYvvlhrGsiEMjr
X-Gm-Gg: AZuq6aK0jssjDqbM4rU1BIZ8nZof33n/0DI85UnXaQSdsMvSzqL9zDKFrFGeyfnKi2p
	zokBnkpKpW3j85fU5hGl3rfEBLBqzM1XnPfmpvuV+iKLK35OO5sn/NhiM4/v85J29HXK2WVvFPd
	46ZbtrHRn6M7vjqPRPI3qYkuIjhn5zJn4MAbYI3DwWFRmAZzBNDAPvCr4pdXcxXdDBRgRzo2Owx
	ofz1XSMB4k8RfRMLt1osu2/Uwc0y2XdOGUVpaJ0hzzSw1qD/I1YQ/xUyd5mrR/FxpiY9hv9t3CA
	HCJJZ4FyQ827/Hx6Abv4T/XLHkFw2mcnI9yA/FxiZUmhEYQLmnAqOKy2CwVLO1wPlKd5erH20oO
	X+H3kVqJvSrBWRo+IsqPA33Azjal1WXHBD4hFTe+JGdPzxX2IUqtIeU7sbv46OqkfUxOofqIjbW
	kxWt1l/vK7kteyETfmdc8qkZxN2l2ApUltFBLN
X-Received: by 2002:a05:7022:f82:b0:11a:23fb:16e2 with SMTP id a92af1059eb24-1276acb2209mr2076796c88.9.1771715000593;
        Sat, 21 Feb 2026 15:03:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af9f74bsm3039607c88.15.2026.02.21.15.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:03:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Feb 2026 15:03:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
	=?utf-8?B?VG9tYcW+?= Zaman <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH V3 1/3] dt-bindings: hwmon: ti,ina2xx: Add INA234 device
Message-ID: <6d170935-7c89-4162-95bb-5c7b160f443a@roeck-us.net>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
 <20260220112024.97446-2-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220112024.97446-2-ian.ray@gehealthcare.com>

On Fri, Feb 20, 2026 at 01:20:20PM +0200, Ian Ray wrote:
> Add a compatible string for the INA234 device, which is like INA226 but
> has different scaling.
> 
> Note that the device tree compatible must be different since the driver
> uses the compatible to configure the scaling.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> # v1

Applied.

Thanks,
Guenter
