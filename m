Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4DF35FF66
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302020; cv=none; b=do/Qki9/BJCgt0xfHEQdnTikl6wNdbUUWTrH0E1LEdjK5RzcHTuSLmQEcZ44VX9pZK0WGlDA1QXhMsHqEcXd+JmGusAkg4sX7AdfljsBiwE/SFVhpilq6gQkMn+elxD9Lz+/P+qtZMHxCAKDfCS/YpEIMrZbXEafU1/5LXE1ie4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302020; c=relaxed/simple;
	bh=8mtHYKz85mrDlNo26Vu/58tRJscT6uBhGIxN5uFSaDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujvYLK7YOQoDEIt0S3en6ESGXjZ9kENV7DQ0jSUPM5S5fkJJw3tIX/AwY4AcDfvKreE+hJcomynbtdgYPJV78RQmSceeDP6cOtYYxh5gHeL2GXr9P6jZx/QNfAjFmv5jQvPxZC6AKqPOR9zEVDOq9Hsam/XwuzlkLkcXtMb1hiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rgj6yKJ4; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rgj6yKJ4"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8230c2d3128so461002b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 06:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770302019; x=1770906819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyK0JQ1lbzkHe30b8rjazNYXS7yd13NCbDJg71YiAfA=;
        b=Rgj6yKJ4Sq8U1eq1tNAPcfU9LGF4Hci96O9m8P39lS5kYQTBOrZUCodFHBvhEFq/OV
         rVQw1lAZ7pYjax3XpS2bndJgWtAoDZmAf5TFiewxKEG8WTUpNWDWDc3UYw85gdboIUX/
         WE1bHNcEgoNx0GVKUkA7FM0bpV4htzke59Px7Ha8Bc3BsA9h/yrqAghqcQoqfcuHvXl1
         NAO70vMA6jaEXGctKH29ak9rVCMAYEc7P9cUnheeLu1lUh8YYGdKrpGjxg1g0fhRdQuQ
         YlLHD6MEJHv1Q+d/BjPGT2Ro0J3qRzUt30buN3YdQL1U/rJKC234oYKLQu9WTBKTVRkP
         fzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770302019; x=1770906819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pyK0JQ1lbzkHe30b8rjazNYXS7yd13NCbDJg71YiAfA=;
        b=I9CefrR9hcwr4O2Awj+WjY219iX8S4ChyNXr0gx8iyCvm2Ef5pC2ug2XDeFBBt7bA4
         EjhtNJbOFdgDKm/FcErSdSYCGJKiUXDybu8bcErU8PhgIhhoZfHsxUSSMKkr06UwWSYd
         G+YONXmfYSD+Gwa+dNa8pQUttOS2CXrVrnCPdD1R5EbxufTFT6WOrMQwwECRc1BC/gPX
         6AYH7/NXtihiTYJ5aQe/Q2w62GEAGc9FKHjVB56mhABopzaag4f0u04Iz92izcecM3gN
         5e1vVu0FxKPFHV2XJ1eJ271dx76U6kZy3K7Kl4EYHfVzwGhRf+N6ZzMkO4sI4a7r46G7
         5tSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMDrcX1TpajoZUF1H34HZ831kd/X3gaRzskDMIpyIWqoQsXIejK5qp/jnNzjGR9BoYcIQam5iL/dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCZQWrKE2oM8v3Hp65NKVm2UTeaa0PvV0N6WtjACYOjW/06Xb
	3nIHzOsrXON/tzA3eEWgAHJ6wwHhVHZrbUVyWHh8+YUqeNDxtlk+3dJr
X-Gm-Gg: AZuq6aJ5zSdDjCb3C1By7VOOaoz3X/3lceDIdE5gUziGebmgMNg6qct0dpTKlO5ozO0
	YIeLS03p1ZFWWZb9b5saiOeH/qInZijpYgB5QnjUvAWFmDDVruVtUgs/V6Ho9QwwedixUkbYdEr
	/lfk/dKzk7JMGKxWnhbAPTQbAFP6YJLpyKBcF4YOgg3KOYXPjVou39ec4CEylKxAG/Nl1KlxLN8
	t5QrGZtN/ldO4N/rA60kA3pM/7Gepv20JQ7QcONrKou/Z+hpxy0ppi8pZgak61W9dxLGwqrY7F5
	5lA6lLzUOxgse6rrN3CXueRjiV+4Z4EMsiar0eWRa/hKOUBxYGdbiXsa2kGoVTpvmMQNxH8tVEs
	kzJGw5XLYUvhmCkAka4ANa7HGHaw7TSJ95C53QJXnfDKY2NIu7BxteHRdi8+UII4p3nFAhXyPK4
	EQ7rA5wQqwbR9vfj5rnPNg8VZL
X-Received: by 2002:a05:6a00:1949:b0:81f:852b:a93a with SMTP id d2e1a72fcca58-8241c19d22dmr6066843b3a.2.1770302019265;
        Thu, 05 Feb 2026 06:33:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d16f5b9sm7826047b3a.7.2026.02.05.06.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:33:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 06:33:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com
Subject: Re: [PATCH 2/3] dt-bindings: trivial-devices: Add Delta Q54SN120A1
 and Q54SW120A7
Message-ID: <f03ee47e-1f24-4170-9bb7-a83a09d683a8@roeck-us.net>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
 <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-2-09061ecacfc7@gmail.com>

On Thu, Feb 05, 2026 at 09:34:36PM +0800, Colin Huang wrote:
> Add two additional Delta 1/4-brick DC/DC power modules,
> Q54SN120A1 and Q54SW120A7, to the trivial-devices list.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>

This should be the first patch of the series.

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d0f7dbf15d6f..f430e49b9ec1 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -95,6 +95,10 @@ properties:
>            - delta,dps920ab
>              # 1/4 Brick DC/DC Regulated Power Module
>            - delta,q54sj108a2
> +            # 1300W 1/4 Brick DC/DC Regulated Power Module
> +          - delta,q54sn120a1
> +            # 2000W 1/4 Brick DC/DC Regulated Power Module
> +          - delta,q54sw120a7
>              # Devantech SRF02 ultrasonic ranger in I2C mode
>            - devantech,srf02
>              # Devantech SRF08 ultrasonic ranger
> 
> -- 
> 2.34.1
> 
