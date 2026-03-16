Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B43CF67E
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681005; cv=pass; b=W8cjeeA+8IthxHHoY/fjdD+IlrHl7npqv2/Bf306TTx8mc7i0AWy561SfxGqiqBFfFvT3AphxSl9Wq44rHTB4aCsMqbpPYlZpVOVH++1Nf0SAVjrWnV/g91s5Nk3Zdu3ZcPgc32arxFkfcHGAEj/Yn//ygieycK+TBB9hCpC9ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681005; c=relaxed/simple;
	bh=dkI9QqpDtG36LgG+kw8ZEzl8s+Rk40Z2naIpV+PYS9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANuw72mxAw4vJAyb7s5Z/6BcneasgdusT9Ru+RsWDEBTlHLMKNBGr1u0Kk0D4YJqUbGicHAXj5lNDAPWnDZoyUX0qYSNCm8AOT+tYCo9KdCFPoFDm+nzpUjUl2hO5LG3qmPwbQ+UavwxGYx8lYhNniAU9GYM38/f4UnAiVn9I9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vA8sNSIY; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vA8sNSIY"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4175330e87.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 10:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773681002; cv=none;
        d=google.com; s=arc-20240605;
        b=MR14uPFwNqhkS/Pw6AvuZCj2491d89WRWyv1nsCfEfIsI1vEt6Ib4fXJYhXz3HGnoT
         JDLYFkImoT3F2ovFnbiYtm6alq9Jv1ZWyfay7Rwsq8nF5tZ1B1Fh8xU8SRqtz3NkUYF1
         u3EX1cD7PsRemR4ZGCDqY7419OmfashOIFUr9pQLG989kg4l0sn3JaVUWjBDMO93AOKN
         VhkR6bS0BldsKxxA+SCuJFG7kv85kJ3GwQ/KrWyHnCnRRpwZsVI79pjqIsBF6Lz+94MM
         o7Zad38hqGAEP7KNZb4lgagAc0Egailnb+LY2mhkoTjd2L0NpSisTlRtrgTlBljBgksu
         PbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VjajILnhW/iAqqxkTb08T/Hii8IQWi4dcNUVIU2+S2M=;
        fh=xW2x+98VrR+ZZ/U3S/Ah1pqFv4tQwCtWSsRa8z7BLAI=;
        b=D/IDye7fQvAQHM5tdbSZOEHOwAU53CtGD2Oq9GK8H5LMzdI/lHEcPRm4F3leRfkhw/
         hqUtmt7tTGiytvz96XSELu5ufjj0NpPWw1NJPWJFl+h0szhIo704ZibUmphakrCvelaP
         PsiOQZ8p1hIFMWslZB2q0IigX+qIo3yBf27pXq6WXgvWKGQyt9RTQtjNqCv4qfecuwBv
         Zj/sT80T6PeLXOkIOw3h2aj1hkrR+x4t7RQKXeRV6BwgknFus5YtJtYu3FqqqLxhF0Yw
         wYgop4ov4sQgINquaFyYUlaDDooEr+M48xFifDLNwBOXXKr62B+E59BOlW8A/t2n+5vw
         QF9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773681002; x=1774285802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjajILnhW/iAqqxkTb08T/Hii8IQWi4dcNUVIU2+S2M=;
        b=vA8sNSIYf/v4LksXXda0XuPKnMxUj1Ibw/V/HMiYc0uWmvIPLbjMjZutFH3c/xTpU1
         RAACgDVXP6gVNYR/uFS9P972GPZRJDMuLumL9oCN8g6TCQ5IqQKJmvZeOtsCc7GMlM2S
         Aa/WFaphNihK40YrMJShq2dVVayP7l5bbY8YUPt0AF6KmANG+U8Csv3zxhf2DSR7QsHq
         jHtRDTb4g0voHjGWEzKpDs9CSbsAig34r9K4wIz0rzOcvVmAPXinmzrWqi9oZxytnRsY
         dPAMooGHWuj0Ty2OwKmypVsAHPji3dnmov2T0RsZkDz/9yTkcc/BUuauM0YpgKZMaP+u
         sGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681002; x=1774285802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VjajILnhW/iAqqxkTb08T/Hii8IQWi4dcNUVIU2+S2M=;
        b=rm5DoyLmausrNFSesbxDowjjvTfsrM/7iBwIOnBsMZROan0ZxRJDqjrF3vLPKNkVsu
         hZLyL9bYxSYPhnPqVowWtz9g/hnGhLR9Jb8pnJmWfWsZ7wIpEteioekTdTJ+THEyCwwp
         GzDRd3MJbnt5zuYWgupa3pz8C07krP82vZ0gmcrVM6dIT+XY7Kh0Gl2KONCCUQg47GiU
         tuy/vRERwBzo0GkVLQzvZir6WYWwLZFY90SX4H9o5Hg/+91VkZm7742UpwyPjjp2dCo9
         J9MW1ha25oj4tPku/u/DslFtIGbH8LgN+d9YyNgN91XuEFWBHVJCpS//kL2SYvN52c8y
         Yx5g==
X-Forwarded-Encrypted: i=1; AJvYcCWmBKvTg73qjMjO5wdh3r4eYsiJGD/lJmQ4nKpBojF+pPYwy/JRdwMTSRPdE7MvNZghT8P1xgTMNxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm3zuwjEIjOxw+lB0woCKXNH45UmrrwSEAbvx7r1WArTBmN93e
	4CReSh244GLTPpUlWoIxb+nQ4TWZU0oB+zjm7N0CxwNiwRvnJfnTjgwM7nX1ko+DIaDyu1MMgfZ
	fz1xldU2v4qJKNDdxi7LuRnfCW3rD08ceNkyJ7wv4
X-Gm-Gg: ATEYQzyMI+JCF92OwfwV+PD6Y0tztE9q3k7cVL/iKmBlKCGoF535mOoRHi5PWHT+ugg
	T7vBWY7Ik5ADuu0/JA+rBJFRFlv5zgUhy1WhX8OlEMw6EILnFYAfhwpisiabAS6VPQadAHA5VEH
	PifJ1f/LteagKuTUe96Xaze7pigJlMdlRkTUFF1rIANhA16m5o1BCGGAubBc3EuLGXyeAOcGxjv
	B9ZwfB4i+YMflYf9Q6llMR34RKaG6R095FDXgYkR/EYAWJsrHyFLj9Hz2MWYaLUr5RQ+wAsNsRx
	g5bWV/vFI7oL7r7/apc=
X-Received: by 2002:a05:6512:145c:20b0:5a1:3207:694c with SMTP id
 2adb3069b0e04-5a162b0c23emr3396226e87.29.1773681001667; Mon, 16 Mar 2026
 10:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-17-dmatlack@google.com>
 <20260314073250.GE4177610.vipinsh@google.com>
In-Reply-To: <20260314073250.GE4177610.vipinsh@google.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 16 Mar 2026 10:09:31 -0700
X-Gm-Features: AaiRm539MAtTSlMtJ9cZiQMw7S77YkLj3Qx3YTaEKJUIvtilcVTIw0VDB1yQ5S8
Message-ID: <CALzav=fWmv_+BACzTLq2Nj2aUux575EnbLRwJTevH4aYZTXycw@mail.gmail.com>
Subject: Re: [PATCH v2 16/22] vfio: selftests: Add vfio_pci_liveupdate_uapi_test
To: Vipin Sharma <vipinsh@google.com>
Cc: Alex Williamson <alex@shazbot.org>, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 9:05=E2=80=AFAM Vipin Sharma <vipinsh@google.com> w=
rote:
>
> On Thu, Jan 29, 2026 at 09:25:03PM +0000, David Matlack wrote:
> > +
> > +TEST_F(vfio_pci_liveupdate_uapi_test, preserve_device)
> > +{
> > +     int ret;
> > +
> > +     ret =3D luo_session_preserve_fd(self->session_fd, self->device->f=
d, 0);
> > +
> > +     /* Preservation should only be supported for VFIO cdev files. */
> > +     ASSERT_EQ(ret, self->iommu->iommufd ? 0 : -ENOENT);
> > +}
> > +
> > +TEST_F(vfio_pci_liveupdate_uapi_test, preserve_group_fails)
> > +{
> > +     int ret;
> > +
> > +     if (self->iommu->iommufd)
> > +             return;
>
> for iommufd variant, should we mark test as skipped instead of showing
> it as passed?

Will do.

> > +int main(int argc, char *argv[])
> > +{
> > +     int fd;
> > +
> > +     fd =3D luo_open_device();
> > +     if (fd < 0) {
> > +             printf("open(%s) failed: %s, skipping\n", LUO_DEVICE, str=
error(errno));
> > +             return KSFT_SKIP;
>
> Both can be combined using ksft_exit_skip()

Will do.

Thanks!
