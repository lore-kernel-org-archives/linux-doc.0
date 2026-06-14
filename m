Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CFB2FE56F
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444482; cv=none; b=LHLfjllp9qQ7MpXMNlIIdFvwSfMYRRnz0H8CeMic6G+ToAQ0jbLoBwB7CKOf8Ed692JWDpNg733hnwJz9aM5uRnnQiHy3V3qLO2S5Ocb0NlIbgusNqqatzllt7q9CGfwpQgx0OWWp8fJaNf3jYqbd+IQcdjOdeOMoujFj6L/gnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444482; c=relaxed/simple;
	bh=9qCCo5jqZNYTFQYhvn1w10HthvCojM5bi7HQ3wIdz0Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SOrtSPuzNPyWx5lSystv6DK+gld7BUqTQ9A+u/vlu9iUes4bWrOtX9g+ELCfnr5KiFeN91gsxHd0U+f/k0iLAaghn4CNl5e6iz9ey/aewJn/rE4eMvFr+NjNJZcQc766L6NRBW/Uzj8dttwNWFkNCcKpDWrU4ueWtU7rm/rnIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=f2ypQdPo; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="f2ypQdPo"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-915aa0a9293so342965485a.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781444480; x=1782049280; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZeAw+vIhY6bA9mSRruzAQBCEt99MDj9JV/iQLow7qBM=;
        b=f2ypQdPo/X5ObV2Fsc6y79srx8rOlV7wyjh2fVB2zaGZ+0+bQVIyO9k+Hj10a3QqPn
         VTFxXR5w3qk++OBbxuVTazwMZoVyg20LerCaxKVLaAHvi45qsd1YTjmGeZ+KLiawU3kD
         WspKvEgy+QtdNKDhXNqGXCFoCRDbjtIRkSFDZDIn35RZvyVgrDOHSVpvck28uxn9MOsZ
         WLc1aElcqBNLDEWNvgXqJBrZPiGGCMPJZTAotc6xyvmTs1QCMzgm+TMnUZKRuEA+HYZD
         SuYsptYgIRn9I7ij3V/DPsD6bOw0u+Nk3dgVy/CbxeEzRGj2DfyRACo7MUlT2CIYIEv6
         f8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444480; x=1782049280;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZeAw+vIhY6bA9mSRruzAQBCEt99MDj9JV/iQLow7qBM=;
        b=c6MH7bDB6HJFEwDefRAnFz3Ghh57LmraylCnt23d43CiwGekUec7Yql1DX6IL6jLHc
         utlH2V0Exn2BNQsQp5TOdMaEeqeEmJcyvwP2xxqHZVktdp/NtaD8DQp23u0tUkEDgmzs
         Kqe6+cr/82F+9hMVu8RgCiQy3lRcf4KUH0XlYioCGdponLgckkmJiZV33Oxjj3HRoowr
         UPc7GB7CH2HVJ+ZjasKF7HOleILzPBSLDRcmlCo5rPV9VXl72rSUrJH5+cHv4ZGg7b87
         EbOxKi2np9LSC4bSwPgUhWyhDFofzUj49F84jDqACzFHJtN6tJOnQmc5SOiS283BchBI
         wshA==
X-Forwarded-Encrypted: i=1; AFNElJ+vcZUqRBQJDblgaepDGYWWdGKn3BcvXzISootnJU5ygLQFC2W0TFJZ0UzjapXt9sMvsLo9uItnzp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOpNr4Ff4kBbEXS9NNDM6c1yCnf3+/gqzxyh2t7Jw4E+wOuGc
	S9N72gqUjnx49ntWlNMKXv8VLxM84+ED3JzoTg+cX3i4GejZ8nAmAEFkALUnSOUypus=
X-Gm-Gg: Acq92OG4YM02ReyeIWpPl9tXIehmFnDPnJ53D5SfOcWXOqqbAW461VsfBrL4R1HOXg/
	10CnvrDmujk/x8lXQETsit3relLDUSvrfYoMIub6oi4nP4Ts4bxWDI4kFqUsjy/R/X1nLbXD1/6
	LKhum4da60+VCaEYQQhA1Qx0zOHjL80XrVOwDrN+FrZMhI+RFhDKTx+yp1nQ/dw11YBn0tHgaKe
	gb6Mt2kyUbyxTJr6uhEXv0U4Cs/0Mm4G59m2XPixFLaGsY5npRtQ5PVcWlr6Tugg1cY0sM30m9i
	3m0MIr4qhufz9DL1zwhfS2IrUWqT5uAeFrIC0e9ME0VXR/YwbnWNKeJQ9YtRS81l21R7pGDt53q
	vidq7muNX4AVR/jh7oGD4U4tKIZgjwJoqUn/AWn6UefdvCI0zC+6HY2iZyRHjmkj7yPkpwmw8lW
	mtw7hNBp0FYetc9xwehsTljxGQ7TZNClZnWGviq0LdHkMVmXqCu1IsMQjB7qkbwXpdq+qFhh8=
X-Received: by 2002:a05:620a:284a:b0:915:80ed:8327 with SMTP id af79cd13be357-91619f73cd3mr1359281985a.41.1781444480052;
        Sun, 14 Jun 2026 06:41:20 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a00af50sm804255185a.30.2026.06.14.06.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 04/12] PCI: liveupdate: Document driver binding
 responsibilities
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
 Adithya Jayachandran <ajayachandra@nvidia.com>, 
 Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
 David Rientjes <rientjes@google.com>, 
 Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
 Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pranjal Shrivastava <praan@google.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
 Samiullah Khawaja <skhawaja@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
 William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
In-Reply-To: <20260522202410.3104264-5-dmatlack@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-5-dmatlack@google.com>
Date: Sun, 14 Jun 2026 13:41:12 +0000
Message-Id: <178144447224.1257322.6028717050680465656.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=436;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=9qCCo5jqZNYTFQYhvn1w10HthvCojM5bi7HQ3wIdz0Q=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqLq9+V5ehmqYdW7aqY5UC46rzyaBztHZtTXaEV
 wNq3cD8aFeJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCai6vfgAKCRC7dyhM23N6
 3n8VEACd7+ln+qHdtrY009zcX3HQrr1PUWTlugPorIeOn8XmTJbgYuCm1D7mH91o1Qk0SZe2+wI
 2S0wRpAHlKaOVEtO68gKBmhZPDreEUWbyJPh2baoB7PEM0rHohe6beLyk9a0EDGyMoizfUQVlBE
 elPL2YdcMN8btmVGap5fkjrisPb/6OsmU2lUYZ+KNnAx38aUZVcUvKDewIbq25zdwlZBUKGecSh
 As9pDuvz/CVYl/3F2pe1wWh3q+WvNwNasidlW+NrS3zSIJVb0xbHv2NXEnOUJcJ127swxUuqvNJ
 Q3siNX2gD5B3zi5rElvySm4JdLzs16A2WhlbSrwn1B93becCXOtZ1Opap0noIZ3rbnK57eIq2nD
 pYRAwOqOK5KN423EhDkvTAWZGYyxMC9vWQBfaAa49JbYobhWtvnGWr1ezCJ8k8bEcf4RRLYXcoN
 8xYz7NI1pblzXU2nq5qcyacPiWBzU90F28R3+LuI6wz45GMTbHQZJynLNwaWubYDsQjEZHym77Z
 X+89BTifV4853SOCW3d5PdFyp+NqcbzEkiRaNg8G2v+FxPzIY5B2QAbioj9U4pY8gLM/BoLASVh
 xtPEpIr93n5If5K9gYKxSJDWp2YDmXIBrR1LD3sDnJ+q/TjpSVubUA9Pu3yUcMq3lQZSfZeqnKo
 h5XFZvHeHeKTbBA==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Fri, 22 May 2026 20:24:02 +0000, David Matlack <dmatlack@google.com> wrote:
> Document how driver binding works during a Live Update and what the PCI
> core expects of drivers and users. Note that this is only a description
> of the current division of responsibilities. These can change in the
> future if we decide.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
