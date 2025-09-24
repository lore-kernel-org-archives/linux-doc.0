Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB202DAFBA
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 14:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725752; cv=none; b=po4HSi6f1TDZK/UEI7ZuLSo1eZIJ7uytuKmx2JcUEa0FiKuP6afl0nckxcETBjgyrrR9NyGOu9XlCcXsA7dM7f5Zq+nXufHDi2FpA+xjRUDEdVj2VrTL0ggUVOs6fBgbzgs/H7VKrU1dpZdKuASRXfIQld8l4FItTXnVfbjnoXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725752; c=relaxed/simple;
	bh=1bdm4ZwS+vnY4SEljyRMQtCEmwu0wpVnwkmS35goyks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yhyw0CStGbPduZxK0ELA8++Q+5D3chCJ/rAFj4rrqdTUKTaMHnN3tHzh6rn60HGyGFa++nYSgzwy61bwqfVZ/qjOsvAY3v+puSlXTek4BR5+vRgz/ykl0lQiA7d6m3bv5cJKOKUnSuy+H/yj2NUrAI7fNPDDstmlI+cm9o1kE9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pk3XV05/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pk3XV05/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27d2c35c459so16401025ad.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725750; x=1759330550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtg/RW/ZQ2hPIrm+uMAg0L2Wfe97VEQrXZv2YdHCE9I=;
        b=Pk3XV05/0gZsasKG5lxzY1piM6pfZCiNjiSkFyEWgkvMDWWpBOJYPW9R/pZt/5JxuU
         jsCN3GHXD7notX9VVHXVUtUCgNma6nnSZxEaYUTJEYnTeXux5vOxC6nMniBNapo0/rf4
         r529bjHzHQK4FCcgTSPVQ6gf/NfNwdlCc9LdI5XSvetU2gP2NQrVu/j+B/gWImVbG6V7
         yIeT1Wp8ZW9rzXwt7foEfDKq8IHpa4/eghupT+r1nesa+3yThnJVKubA/j+oioE0ODJm
         GqDnI4vtC7bYTBynRMoLLwVsO7IzOKE4aH1bnEYz/XyvSW2FMRBp1FkNOExoVMUh5spI
         mH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725750; x=1759330550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtg/RW/ZQ2hPIrm+uMAg0L2Wfe97VEQrXZv2YdHCE9I=;
        b=RHWNyzplZJoBDwJ982J6s7DHH9WBVEn9x/DHwQgZswgH0aGx6OnLeWU9pE8yRncxRP
         g511efuA3zNczbUR/e50rfK7dXO1eXUrP6fHOzS6hIzxGv7v2ZEdNhxPF1U3oIH54Bjp
         M2YLeQ+cMt54CdK2xWJdLImM8QI4yuNhHXmxn2vlO/c9RVzEr5CVsKFg4i35ZgFsJJIb
         /AyBBJLxWLtCm2+8D9pPlj6FYWnW9YqNWvk+JIpaDm+dODZ3VXahpQrR6bviummeYyku
         YXzZKtfpn9eXZLLfCJxPg6B8AASGFc/Bom/Saify8FNW/1DKLe9regznKJsDweVPHEik
         jE5A==
X-Forwarded-Encrypted: i=1; AJvYcCWVkBer0ZpVqhGPotBDlIUMNETNux2+zAZCUXK3Q01AsqCOD7jd9LoGhG44GzHDJIAX31BccitRkRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMBNEM6C6PrUBkaByRzm2S/0xUMHE6yYeiIOprDuO6NBiuyRek
	PuAsdjo6jyJaavqHsydCzQP1dhIrxaXj/SbgOQK+/FLcMZddIVoyHGJN
X-Gm-Gg: ASbGncvayW4EX7a4Fhjp3Azz1+ejDAO8hlZ6PhZLFmx1zy7N1sbPega/9pA8hesVs2X
	m2Crhz75y4DluyheLQBchMxZaIYHNz2z4HghDW/BB7f0qP3BfH1eHBJ59VIJVovsDP8lgMDs9TZ
	TFyjz84eb5RAPJ0V0mBzQCg/m626eULkM2ROOw/PX8Y945LDBYADpQyU7bwn+Iam22zqN9U4lil
	9XYJkvpghhWHiC51ZKKa5y8SgO3/heSGlZ9Eegbco7yuYGlunZg0+YYa5K90jmvDNjbTS0l5V6n
	wY36bRc3dhNYpWfAphFEsmPeeEf8e7rF9D6cQsRHHtRivPZRkp0Q/Hf7m98bJOXIK3C4acYjX5L
	rcpfWF4tPgn6lkwVaaAPo37mEHiFqtFKdbDA=
X-Google-Smtp-Source: AGHT+IGnenyE6frrx61hpk2H1dyCzynS+vL3sXDmbZJarOVCZ/cfik7xdg7mftRkCokyhtVFgoFyZA==
X-Received: by 2002:a17:902:c94f:b0:24c:7b94:2f87 with SMTP id d9443c01a7336-27ed49d0885mr199075ad.14.1758725750379;
        Wed, 24 Sep 2025 07:55:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053248sm194608665ad.15.2025.09.24.07.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:55:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:55:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jdelvare@suse.com, corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: add MP2925 and MP2929 driver
Message-ID: <360d3c4a-79ca-4482-a020-2cd477dccc54@roeck-us.net>
References: <20250918080349.1154140-1-wenswang@yeah.net>
 <20250918080603.1154497-1-wenswang@yeah.net>
 <20250918080603.1154497-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918080603.1154497-2-wenswang@yeah.net>

On Thu, Sep 18, 2025 at 04:06:03PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS VR mp2925 and mp2929 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Applied.

Thanks,
Guenter
