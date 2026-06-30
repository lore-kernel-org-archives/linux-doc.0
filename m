Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80F31E828
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 22:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782858112; cv=pass; b=rCeW4dAoykI0NJyDtG1+sV3fOCxP+3U39TEs2Km+Ot2Z8gev1Nmn1QEmS4aMeuNk+5W+79T7xmh7lNcOLcg4Axmcr3UbNDBYCl9Ak47KHQhinusCczJfZr/sxa4l5YyKXrUDhGAQPWUJdmW9vD/NE+IOy56Tcm0MV1WlZAK8Z20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782858112; c=relaxed/simple;
	bh=DR0tH2IO3fN80hPp68tJnACbZx0ZviQ8SFdx1MtberI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V70R7dBUOpUwcST7PsBKSsT3oJfJWhp6WDRPN2zrbE0+LlV+bqfHjN6GZwvpA+rKVox4GXW9oW8472RDbvDwKqoEMk2fWXtGznxFavYTz5SdMV+VOu2NwyNlyrXS52tZ9kNavi3lr33aX28FTBFwA4KaWGBS7jDkjqm3byuR3w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B9WuzwHb; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B9WuzwHb"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-139f1dfc9faso5304261c88.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 15:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782858111; cv=none;
        d=google.com; s=arc-20260327;
        b=SKW4dJ8JZzs2PgB5gEciDKNY13jbJjURyyVdkBICmYKxS15oLSp9OZQKkMIdKFD/N6
         zskLO/UQ6jRjgswwJGYLkrQ6djN76CvH9aqomum2J5FUSBxhYomC+QvkTZ7FzwYAc0SX
         qzo49miGLLBvsQhgL/U96LKSjZNusfZ7biJlsH1ipkBtOLmnwsHx2ZExkHjVvaOamsXt
         NqLZZnahXFnpOabpg/ieUgJsHYgOBOg/yk8S3xxwg6Zi2r5K7msbcIdHg1hcY5mCgHH5
         MwmI6lUyKXRfkIgBSY9h3mIVPRa0PaExGpHdKwlRDHeueakBbTZYYTvr/uWGhlpSw+HY
         UYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DR0tH2IO3fN80hPp68tJnACbZx0ZviQ8SFdx1MtberI=;
        fh=PufW3gezjinlAeJWTBlHm0lI2nqCobRW28KCnyMdrN4=;
        b=Yvn3UUfFl5cjy+38au5nOxp9NHajc9knoJFWbzWmzj+vj5YIsjF0+iUMMCgUb6HEVU
         2rn1wd3hhfrBOXKhpoG0Zz/dUSQo4lsewGJoQW+SfHjK7gACxsIaF4q4dSaYaLzxdhLE
         slJYoJECnYiot8vHnIlvQXPmOy4/V2/jr4Sin3KPuhgcbR0wyaPdEHOzeroMn4HRv7Sl
         SbNAFVNP2XUw4UM5aOaH5/WkOrD+ZKD5s30MF8eAKr8Dt/mMUeQ7v+MS/yCY9VMpAvWr
         hPG6kbckKvOR2q6M2uxPRqs+hSqnDIgCfjaAIWIHEWgR/fo+KANSWd7ju7vtL3UYN+4j
         e4uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782858111; x=1783462911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DR0tH2IO3fN80hPp68tJnACbZx0ZviQ8SFdx1MtberI=;
        b=B9WuzwHbaigQyM1oU0Z7GSraufv3HeZOr/QIAwzQkrrT3V5/MUv1/kl/SB9w2vG347
         /L+sF5wU1VT+LS1ZmXHhVAjX5/KkN1qwDKIlNhSsPg0vz6uwEWIWeJ8dr+xm6tvIqpcO
         L142kxDDlLQ3g9eMCRDgEzU+FJgyXK+vEcpF9P5/SGuNqY85f3JULLbCTGpEEavIWo+o
         v7ovR2UdNNmPWdFjy5YbzwG3Qh1EC6hJ3+vkhqWRosXL5ST6ZbTPfoYY0C2WYMH6aw7C
         VU44FFbeUKUFVxsLpHba80xb1FgZwqnTruJE8YDLo7ytL1duo0jBDKOPc6wYx7ycUF0l
         9rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782858111; x=1783462911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DR0tH2IO3fN80hPp68tJnACbZx0ZviQ8SFdx1MtberI=;
        b=bygvzwPCDeDvocHE6kPePKFJNZNnHfSR31KEqbU67pOoAmwHN8t1k9cciPkX3gosyW
         73fby4dLCXHXo7SypNnioL3m4pmsv2cTzIy3xUndE4dxFGh4i68Q0hvTYG3R3QIIMamv
         ZGDQicz0UltYCo/Hiha28tOawiRdRHZGW7bMlsrqmsrgXzPjRN8UeVjgejaY5qxUk4tT
         +EuMfD1Jt9GW8mFnd98/DEbm8y98PwuGVKMY/sEYiIyxfFeFdzUrnUejG9QSPI/xwzFI
         Er3aN4ULnh3t+Cd1taiXZCMdXhEXO668ZW6eoffsjG4a80awPLd6I0QYFOuu+3yuYuOi
         pSCA==
X-Forwarded-Encrypted: i=1; AFNElJ96BkUo3PCYfey4WJVEbft3eiZTXfdmV/vQilg1Pu12y5wQX/4cf0IPvfq0QMHoBKTaJERcAPHd5mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tEbTEN7zu/XNH87XqcfQrl0/Bp+ksJ1YZWZXwRzQiokzM0+C
	y0+ZqdIF4Zbo0UFtVskPvGkc+wzOFSzcMu3Jwy6W0BP9hR58vLM/XH+Ql0rcU/B9hesz3ieUKss
	Ub8K/WfH9f8xRNi8XUM82g/0DtHroh26QWVZilaER
X-Gm-Gg: AfdE7clq8hd8qdl/8Swc+gqtR/IpF1pMhtkBR1COlsJ08+k6dDgoHhLHZG9NkejoLC6
	VClLU4ZvHTnxzB7Sl6ev3G4/veem6cHCWxRLzIvBZYmn1cAIz1x9G51Us5w6iffQm/0P3YNyegW
	5KEaJCX83Cb8B7dBC9UtsCV8hFenpb8JTPZFgiXnS5vep9S7/dp1kFJnJT3+JNMeH3ouFnMRyvD
	/SINY+7rd1CDYt5hxIhwTFeiXMbJH3EMB77Q29mnQBi2TjrSC7amLB9UGCGpCHls8y/+uBs
X-Received: by 2002:a05:7022:923:b0:139:ed5d:5c9f with SMTP id
 a92af1059eb24-13b2a1c08bamr3407677c88.40.1782858109859; Tue, 30 Jun 2026
 15:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com> <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com> <aiaeOVomxQZhoM3K@google.com>
 <20260608181640.GO1962447@nvidia.com> <aigtS3UDdhUGp3m0@google.com> <aigyn66-xQ_9JBW6@google.com>
In-Reply-To: <aigyn66-xQ_9JBW6@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 30 Jun 2026 15:21:22 -0700
X-Gm-Features: AVVi8CdGaAQOsRR3GiQD5WoDqKgNzoVt-sa6rd2Hjmz3ldGohaSjMHvZ8NY85tg
Message-ID: <CALzav=d-JD6ZbUNEbRMQwnvOhCBJ3ruodr3wbHM=1WA++MCKCw@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
To: Pranjal Shrivastava <praan@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:35=E2=80=AFAM Pranjal Shrivastava <praan@google.co=
m> wrote:
>
> On Tue, Jun 09, 2026 at 03:12:11PM +0000, Pranjal Shrivastava wrote:
> > On Mon, Jun 08, 2026 at 03:16:40PM -0300, Jason Gunthorpe wrote:
> > > On Mon, Jun 08, 2026 at 10:49:29AM +0000, Pranjal Shrivastava wrote:
> > >
> > > > My point was that a FW exploit can meddle with the bitfields of the
> > > > ACS_CTRL to spoof and mis-report the ACS flags.
> > >
> > > Devices can also ignore the ACS flags. I don't think this is an area
> > > where we should be worrying about devices being actively hostile.
> >
> > I'm wondering what happens if we preserve IOMMU groups across a kexec,
> > but a switch's ACS capability is dropped or the ACS_RR bit gets cleared=
?
> > The incoming kernel assumes that it's the same ACS cap from the old one
> >
> > Now, the incoming kernel restores the groups assuming they're still
> > isolated, but the hardware no longer enforces it, silently allowing DMA=
s
> > & breaking isolation?
>
> Again, to clarify, I'm aware that we aren't preserving IOMMU groups,
> the incoming kernel has to rebuild the groups. My concern is that if the
> ACS_RR bit is cleared during the kexec window, the produced grouping woul=
d
> be different than the old kernel. What happens if two devices on the
> same bridge were assigned to 2 different VMs?

In this patch the kernel reads PCI_ACS_CTRL after kexec to determine
the bridge's state and uses that information going forward. We don't
assume that if ACS_RR was set on the previous kernel then it is still
set now.

So if ACS_RR were cleared during kexec somehow, the new kernel would
see that and place those devices into the same group. Someitme after
that (I'm a little fuzzy on the iommufd restore path during Live
Update) the kernel would try and fail to restore the 2 devices into
separate domains because they are in the same group and thus the 2
different VMs would fail to come up.

Of course maybe ACS_RR can somehow get cleared after the kernel reads
it, but at that point the issue has nothing to do with Live Update.

So that's what would happen if ACS_RR ever got cleared during kexec
and seems reasonable to me?
