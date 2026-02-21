Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F72571B0
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771715066; cv=none; b=ENrTVJSg7IiN+hc2OsfQ7Y1ekx/vA+6vxh6gtX9+TPNktcZG3zm7FagGrFoyvzHbLal+ephe4mJYIbbeAaA3vLJMsNLOM48eU7yEkcG/6jk/cyyIMs/bUJxw3zCAXLa5/6VYEae4rnEaqt1FD105qpcqpj98RlJYW1VzALc8xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771715066; c=relaxed/simple;
	bh=F4CLIfytilJvnTwA02TvCs0S+RiRZBok6Am728cvIBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jo9CHFsSeaah/XAwQB43UWvXxYU6KnTFlR65Wsn95JmhluwehiYqYOzdzu9T6wijUlXzEu8/wdWwSjtIwORDhm5zDwOpy1qhCjzVTARyse6KNMDUweSocsdaAg2t+7aP91Yh1F0eiEV8wkc+KopUjtgBFERohxZQk5DpcFjGl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTrBQoXj; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTrBQoXj"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12721cd256bso3616560c88.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771715065; x=1772319865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgyBxQobX6hLEZu+PS4ltH40DvIKcprpQ8pSAJQ08kQ=;
        b=UTrBQoXj5bZlw7ltscyHYy9b4PsZ9yAy6H9R35Ufl4jyD0q3OBHP3Sbd0GX4bAdHke
         7UW6lWtz5n51bZoZ25ajpnDsCRlktmul8y/MacL/e6bRQ47N+OzKDLS55tMBCU464y+w
         O2s3MZpsJsjxbMxycIYAz3azwfscV42CeTAVS4KlR1xYAWtGDv6zl6FdtwYkNd9YUARz
         9W3J+KvImqY0T9bbBnoNTqseQjY2Aqdd/dCwBlUD1jfYyoDpwAfCXv8E6KdUmNWGiSJh
         AjwB9ty6y7x1ol3iKMks9lRQ3qM9OXxQvh2/Dv8N7uDSijvbw3LuaDwp21XqxRhrBj2L
         GK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771715065; x=1772319865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgyBxQobX6hLEZu+PS4ltH40DvIKcprpQ8pSAJQ08kQ=;
        b=NoBd/DoNf2sIDwTzXReTXKEfYxo57j5ggb0JGHkswJXp6bSYy7cLbHjn+utsRDADp9
         TiYgmeZPVk3Z/qd9KyNVJOiykISXbEZv3r83NFH/JUNgS+ITBi5YikyxlhbunaTBXi2u
         dVfhy7g2lAjPYIrtdGce7uSIgJlKetl+f45ZX68Q7XB7l/8IcDWnmZ19Btqij64zwAB/
         Z1rjwe2xD4l6C3vs9L6kcbKT59rQkn7wB7GtY/ibbgoIf+Mx1e8pOFi9oZ/l6fPep00k
         KgZW53LUxx8EAMqGoFhopZv6qQMrpzcEu+tWNn+ha4CHfgTNNtya3E+c0uUURIzWMkvF
         TUKg==
X-Forwarded-Encrypted: i=1; AJvYcCVePw14+a2rdi90ZJ+NhQt5AJ4nbbyCcj99AG4tRRIpXVpCHWRbl5WIlurYoQ4iATJlDevaDnY7Tzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YySQt6LGz1J8BlqqWeCdBQ3AD/cis/wvfuNoKbv5CAPxUgPWszQ
	pVvxbgGuvJG8a5cRCOwoz4b92omcy2mfhfGXSjIcelRdXxQuIw3FNU9R
X-Gm-Gg: AZuq6aLXq+FPdKyV7jfPQN9eKY+cvabD8Iy/xI7U1hWbQjo9e79pnBjzuxZCfxp87qj
	SloI8PZGFJg1IRTA58V20Ov97tFEdDeBMTPGcjtSgfJTlwg3Faw3gXT5iD7hS6YJQ/K6AwSs2dC
	LObkmPIQsDbcBGmC9vaSUYFVjgiltHEvUhJLbO5m3FZbPIvIAUf0CeuBOB7c0nY+sXYlW743dHD
	GNjzN72yf++x5YfazPlbYUJFoZ3C6CgFIMkQvJMi7RBkxMptFeUDIWZCtAEY1x5OMY1LdvOdIbm
	M7mw6dqdVvL75n+5KkXjxpJWR+K3+u25erQUFwTzJAbbQN3pz3S3aYXLfzyNzNcliADvqCQEKdF
	O58YFmj9RWmX+Td5I5eNJbKJDL2GrKJbI3CR89LPwiZ6VLVJtlOcBoigqbixAMoJOQDeQZjlJb2
	rvI9NS31mir0nycGB1PE0emcsymqS6XE5vuVzj
X-Received: by 2002:a05:7301:615:b0:2b7:8b4a:15b7 with SMTP id 5a478bee46e88-2bd7bb38617mr1921205eec.16.1771715064847;
        Sat, 21 Feb 2026 15:04:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82desm2224270eec.20.2026.02.21.15.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:04:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Feb 2026 15:04:23 -0800
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH V3 3/3] hwmon: (ina2xx) Add support for INA234
Message-ID: <aebd0678-bbcb-41d4-99cb-6116125d72a3@roeck-us.net>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
 <20260220112024.97446-4-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220112024.97446-4-ian.ray@gehealthcare.com>

On Fri, Feb 20, 2026 at 01:20:22PM +0200, Ian Ray wrote:
> INA234 is register compatible to INA226 (excepting manufacturer and die
> or device id registers) but has different scaling.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> Reviewed-by: Bence Csókás <bence98@sch.bme.hu> # v2

Applied.

Thanks,
Guenter
