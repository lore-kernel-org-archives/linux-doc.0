Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD1646D0A4
	for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 16:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651052; cv=pass; b=lhX2WZu/GVSu2SHfkGbvZmrQZ3k8Yb+XROLcPt/IMXejGEoMnGYJjF2LsXbolK6CFWXQE42rtsXzt5xCNmGd4FQK2l+5DTa+3rsOab7VSJR2NMeiYwISC2KZKAi7ipAytobEmcvusEz7axLNLpcPQ4LUR7+dlQ7zTvaUqF/9XwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651052; c=relaxed/simple;
	bh=w7TqouPLSZWjqpS6SB6Qduh6O2/m5T9gRHXf3A1juLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SeKHe3N1lQ69JTSy3QGfQ6EU6cyd31MLISibp/7jXP8hoqhNKmR56x0YvEIfKk+TeVlO5KNXDFU6qJH1HUEnIZO9yCwrjxTZ3MYLbs0bJGXjYKuuEwhXuhfsUTAy8NFQM0mYR6Bj3Xg6wNa5bG9b2S4+Vn/5L2IPYiTWQU6LtfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b1SXohPs; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b1SXohPs"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so5615e87.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Jul 2026 09:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784651049; cv=none;
        d=google.com; s=arc-20260327;
        b=qB1visyFOAGpoE0XQk+2WAb7gvbekt1y463XNGN6pVqRxjaGARM1xffH+gNcKbqyaK
         sIe8hh18Lw9W1auwkbpX46GtIl8dHqYTpjOs1+0AHc/9TsZF1ENhrGIrfyhr+CayGnsj
         HEvYaZivzyRAUcNiirDAJoJ6NaVANQjWaU7aVo+3RerERGJY0OL5bXnciENkrKUNZsRQ
         gSQL6ad008LYKN0Dr/+S/1LgpiZoPKxlZjgKHMmfGrKW2Meayn+gXnQGJskmhJjeO5id
         X9ruopJ+7+5++0ELhwAc/aGTLTeghp9JIrO7jyWMv+pGHa9e3HT+qXK186vUwOdaQaRg
         qWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6IIRL+XPWpelEfDBhGxVOXyFyatQ6xSvU7ZF4RnBpbA=;
        fh=1YCuMyZ4TyqQ1OiJHwHP5+sMMzMHlv7IHLk5mkhsXc0=;
        b=IbwHHupMUXZ+pKgOO8Rcfe6NLKcUQNSkO92l12gX8OvDq+g322Jf8Znbkt6tMGQZ5A
         YqDXNf57r6mR77PMeWEV5stu2jtFCKC7RiiCW2q36RsMoqh5ReZklZBwx0V1L3TN2moL
         vNK7N43IdP9fPbI0KZDYVDHr55r0s5DHY1DpiWQvB6VhgOKa+1q+UTaydEv4bsQN9RNA
         4wr9tuT4WnunCP3aBwHzxojO6pB5y3Jwcy+wALQM0ytELD2VLJ6UFRSrxjXKfBbPNXtC
         dQX8P+l8UgbwSWJtGTt+BmAf6Zpp8SF0hJwfNwavHrOJchU6lKi1xVN+ppEURKfGKP06
         G0jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784651049; x=1785255849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6IIRL+XPWpelEfDBhGxVOXyFyatQ6xSvU7ZF4RnBpbA=;
        b=b1SXohPsmBhAjNS7tX+7wCgZ4XVGVYt0n+ahCjH1IBuK0f6JnYp+h8QLJBwO6cYclx
         eWd+Ym4NbONLzFtQX5WleFaDHg2jh8hyrei3JJVBGkUvPV/qGNW2+1HRcazQvnRpgZUj
         ZBZMckX+v0xZKf6z60vUBYxYaYJhXW1e0IJXGnvcObLnhtloIYt70Z5hi6yzdQ+5UHO/
         ylpHPCYl1UQUp7lhcnmN8FXKOy7m3RNH18cBvhonDwa+42Q6OLz3jEHZP3GlMLwWpVt3
         awURqbHbZoYrrkSRcxlq3wAwYb5NDD8L5aeUFq8Aw8vssjqpuj60QQMCvUdWUr3oDndm
         JEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651049; x=1785255849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IIRL+XPWpelEfDBhGxVOXyFyatQ6xSvU7ZF4RnBpbA=;
        b=Ge9mNvkIpDILA5Cdu+S1cnl3pQGDXYHBINp6y6UoAGEYsHGN5EEIyXb9/J8SWIsgQx
         ccSq9/Va/18/85U9JlHyKYqdwtAblLSiTqul8WhXtIQ4K1POsvZGdFf5DbTUNbE1UE4V
         ynhiIbewHJT8KNsnAFghPnrC6kFz1bprv7wUBQsMHGkfUen/eWTIOwZIMAz8aKeyPEwW
         GIGuzW4cnMJrbCWbrxONMUq0nS0qgKgBHFlYEuRQYK4hnfzyPW6igHus9n6WOu+GWVTj
         Q9jHEVH5+8LGukkQZp8ne3+29m8ntvGMAEvN55vqaVzZSTAUxmf0mz/lZfJNAaxejxMR
         0AEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl6AhSLvviR8wS78PccbKags9jvOVpb+MTVJVPx4OptWiECPjtInSx1uqV+v8/Z4eObOC6kIvJh4s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17GkkIG/OGNwOSU0GwMl9Pe54Ew1vwLUR/OMZXeVLTinK4aq7
	LfDpZIahLiofzNOAAufbiKHogLVewYQNVECwgu7FKDYhZx9B2YTAHXTZs707+Ahj8sP7/H+PdQ1
	KNSoUQgsXuJv4jvf/JBaqlnrfhPVckxgZl9Ufkos=
X-Gm-Gg: AR+sD10NuWf/dDXQsau2Cw1ZaxUrkYZ3gXlXOFwIbKJeYdNwnymWwUSQ05geBnzq5cA
	TNlyK3CNd/2ZYtcj8oH2gKfPXUnakj9MQ7no2dx01ZtYh5nCk5cWOyuVlmenmJ+n1V21SwV7rtW
	Rnr84+WDja0+1+bMngxBt0ZsOIhSa9rxVmxUPf0nibQPMJqvZNxnP54PX/Oj9xB1wk/IY5n9il3
	R4CCxfJ+kGpzuYGfwbPLA2aXwu7Tf7n5crap/KAldQiwVFUtSOQwaamcA==
X-Received: by 2002:a05:6512:ba1:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b2a31c4862mr327591e87.9.1784651048492; Tue, 21 Jul 2026
 09:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714151505.3466855-1-vipinsh@google.com> <20260714151505.3466855-11-vipinsh@google.com>
In-Reply-To: <20260714151505.3466855-11-vipinsh@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 21 Jul 2026 09:23:57 -0700
X-Gm-Features: AUfX_my4kAQgnpjbhryasf2kLrfrl2S4l9xVYW8Rn_Ur_MRpX7wHXzL-Nzt7PMM
Message-ID: <CAAdrzjsEG2DQoQbNe4aeq8gNF4Td+N6_gTifU6=EzAEuySu7PQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/20] vfio/pci: Retrieve preserved device files after
 Live Update
To: Vipin Sharma <vipinsh@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, ajayachandra@nvidia.com, alex@shazbot.org, 
	amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, 
	chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, 
	jgg@nvidia.com, jgg@ziepe.ca, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rientjes@google.com, rodrigo.vivi@intel.com, 
	rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, 
	witu@nvidia.com, yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 8:15=E2=80=AFAM Vipin Sharma <vipinsh@google.com> w=
rote:
>  static int vfio_pci_liveupdate_retrieve(struct liveupdate_file_op_args *=
args)
>  {
> -       return -EOPNOTSUPP;
> +       struct vfio_pci_core_device_ser *ser;
> +       struct vfio_device *device;
> +       struct file *file;
> +       int ret =3D 0;
> +
> +       ser =3D phys_to_virt(args->serialized_data);
> +
> +       device =3D vfio_find_device(ser, match_device);
> +       if (!device)
> +               return -ENODEV;
> +
> +       file =3D vfio_device_liveupdate_cdev_open(device);
> +       if (IS_ERR(file)) {
> +               ret =3D PTR_ERR(file);
> +               goto out;
> +       }
> +
> +       args->file =3D file;
> +out:
> +       /* Drop the reference from vfio_find_device() */
> +       vfio_device_put_registration(device);
> +       return ret;
> +

Remove extra newline after "return ret"
