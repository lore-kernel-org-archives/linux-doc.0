Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D68F37E30A
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 22:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777503434; cv=pass; b=aWqtAMNwhb+wHlzgFW6vIaYQKoBajiCOhebcF8bXA6xUE7Acfmpj1ZhebZ+TMIccnX+pCnIyOeBhEtuBDh4dJCY/iDshuOsmyTWYZ9yvy1JbgKrq5XBoO8VzBVLjZMohs/BngVhspjwGxikXI73gvIcCM0o2+Dg++7XCnsIkVj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777503434; c=relaxed/simple;
	bh=5PgOh4MKm9Ysku8H251/i15pXVhU7vwYYgGQfsH0l+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U9yQ5BBmtTMgcLz1Mfms3q5GgaO2FsVY/CI6hK6/T3bryd4zVm3J7740L+gnJDKSl82j/o3GhJANunpzFxPjDVwNfEK7iochib4mrnZlF2g3iDXI76LqU+2qHK6erO5LOUw+wyP6KiLftxTUHo0N+aURglBgb5HoyxRsnAyb4/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LqXQzpGj; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LqXQzpGj"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a3be187ffbso1294851e87.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 15:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777503431; cv=none;
        d=google.com; s=arc-20240605;
        b=Y0zq9hOAogoH8mi/nNuDExMaZm0nMyc8jv19avFLuJFIswLDw3UPUAEtBO5qQuWjIW
         ep7iR6EJEsNY6tqIT4dC53mYdlTdOK6B5j7vq7VNSv1Z6Yj8WSTddnaPX/ELHXtafreV
         SZlKIXAL6Ti/dK+ij/CmfXYLU2lolTFZihbD6SXyZ3FCgsLl1z6WlJfg9PqMaajsqUTy
         rlchIWhevyfBrkBFBYYSK4k6MCJmCyzhdz+8KAykWqJygE4xPk+ezz/n0DBPqML2MiPH
         K0UnKje3CDW38fu6N9n51moiT7I2dBb5F0a8Hdx9+o8c5dYN7HAT+8sCdGNKhJCqEdpM
         UKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5PgOh4MKm9Ysku8H251/i15pXVhU7vwYYgGQfsH0l+s=;
        fh=VKVTyXLd2Yvm7hn8m3MzPL+uNn6ISVi0ouhwYuaD2Rk=;
        b=UQcMXmnIO/ETe7xd8ScWFfbpxoVAY3deCukr/owykZtGZn9nQcBLJWuV07r7WE/rpM
         VnTz/vsIOqrbX9uKG0rLQ/3subxXv83uiFrk5cN4ock/NU01PU3XQh0XTyGZKmcjlq/U
         Po51MOWls6dNuZ8EAvSxuhFQ7U5AqQ+vjHvdzlJ9PJq3vqmD7fXKHbDkOkhTIzxc6z3z
         0SgC2LKNUVMVHTQFUTOfVBBY07nIFgDfMJdh/ht20P5GkidJYvvG6hq/B1+ZW7Oh7hU6
         gbgGge2UrBjhv5DrpdsqGcWM3PzwLBSvYYRMi9UMcQd/QS2i7sRWNeearCUVI2SEyPUf
         2ZnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777503431; x=1778108231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PgOh4MKm9Ysku8H251/i15pXVhU7vwYYgGQfsH0l+s=;
        b=LqXQzpGjCk7uwZQudFI4VaHkXWM6afq+wXD2IRjAwdrJsiKWFgCXoxBjAdNkUMS6dq
         UB0FgxjnDwDeQcsiYzKcPW4CkI7h81B/EaMIgfqRQjJG+vDjAeAi9l7jCQ2bw9O/H89a
         I7xaQFyqEacd2+o6xinaVsRE+PgQpiV+mVbkb/BjztXqQGVP0ul5WwZjlqKhrJ6WZKnz
         zsmSTS8pgW0GyTFBRlbh1jrUc2gFJHgI0LX8PQZznCZMM8CPikiriFKebX2sFV9lSMpZ
         wi3QDjyvginO1QlcILXdz7Zok6VU2i7dr0l35ZkVI2sJ41oRklukpWxUUXngJVgXvmGV
         CrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777503431; x=1778108231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5PgOh4MKm9Ysku8H251/i15pXVhU7vwYYgGQfsH0l+s=;
        b=a35CtoGQ3ZaVro3zpdu/6cGEKWegNNeyltYsCYHt8bIJNypvpHzhBGu45X0E/t30+T
         AZTAzCsrDZQOHGh+zjNVC9BcSgvwc3aD/XFKkmaiE+BOPE5EzY6Xp9rPveDZmdYzrT6k
         WQTFQBzqKYtZ9NuwWDJcvVfg5LA5IiraH6NVggWBSJ+MCx6rC/p4ej59L1jjsgIycb0L
         9dFDYVnhfxBQrEE0H6L91LAyrUPhinDJTznogLPmFvCdGNpIGNLphCLyC/TkhfnRvHaj
         CeEfvbSbgv7KwSAxiQTHlQclgtNOW2GiW7V2tgInblw+4+Pwdzsg8v7QEDSLxsfgxzA5
         tw8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/REvXlW2qXE/TjFQXv1e2J9td4qi/7xaaoALWZGWnOp0dVPVjcyGiACc7dQf4qzemvLOW4Zm/o2rM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZRw1ylD9LTLK0h8L0yat+zxdNzyIZj53iOiAeZjVqbE3CRZkZ
	++/VRqys1ze6nAXcn8Zh3J1aKQYHvadsfF+eXRFt6chnuC4+sjk9vi5q/QSnRrJVVa/ozQXAn0X
	k4MzM+A3zmQW5cEQHOeO7LOtyaKScW/KTYZ82CCEo
X-Gm-Gg: AeBDieu+Km3WocaDg7PNcvhySxKl+v1hxWcb2PuBeSYftEiexJIP5YThg/8LDCIBl+6
	y9JYh+6BXADNdV0BccbxVLJJDxSNvCKu26in5zAzjCVHGpHT8Qed0kUNbGxCdT3Xxird7pZT9qr
	YpCNgOGbp/l2cfXB4KLxBZusjWTWgSjnpEmVJy5qSzrxLJrn+Dvj3pgM5DtEzC9o+t/7z1ZS63R
	ZXbKD0oizb+cCUcK+9znrJNNkq6rWzSXbDI/GLmJWn1llNohln6VfmQNgpcPgNPDjUh1y9TnjHV
	vyBf9uXlYal6ncrNqPBOnfT6KJFobQ==
X-Received: by 2002:a05:6512:1148:b0:5a7:4912:1a50 with SMTP id
 2adb3069b0e04-5a852741d7amr22979e87.20.1777503430946; Wed, 29 Apr 2026
 15:57:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423212316.3431746-1-dmatlack@google.com> <20260423212316.3431746-6-dmatlack@google.com>
 <20260427114745.00000656@linux.microsoft.com> <ae_J2pRWFf5qjZXb@google.com>
 <ae_SHCjNGrEPurzH@google.com> <20260429152814.000005f7@linux.microsoft.com>
In-Reply-To: <20260429152814.000005f7@linux.microsoft.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 29 Apr 2026 15:56:43 -0700
X-Gm-Features: AVHnY4Le9iheFK_YlZgcrAybDAS1kEhRs6kG_ymy3g2e8lI5OrgvcncvoFuHHPU
Message-ID: <CALzav=djG6T_NfwDD+aoobMfqdCkG0Xo8hHU2YkPc20uJdb-qw@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] PCI: liveupdate: Inherit bus numbers during Live Update
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: iommu@lists.linux.dev, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Li <chrisl@kernel.org>, David Rientjes <rientjes@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Will Deacon <will@kernel.org>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 3:28=E2=80=AFPM Jacob Pan <jacob.pan@linux.microsof=
t.com> wrote:

> Below looks correct to me, but I have another question. How do you
> stablize PCI BARs? PCI BDF stability does not guarantee BARs don't get
> moved, right?

That's right, this series does not guarantee that BARs do not get
moved or sized. For P2P use-cases, we do need BARs to remain
stable and avoid sizing during enumeration. We also need to
ensure bridge windows are preserved.

My plan is to send another series to ready the PCI core for P2P
use-cases, sometime after this one.
