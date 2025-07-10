Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA4D2E5421
	for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 11:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145783; cv=none; b=gy7KWnawe+q22bGjbjo5eET9pyVcrur3ZFta1KJeuoWBPHj8lM0ANDva2BSfRlez33gbDTQZK0378WzULeubm3VY/QTJ26STC4s+SZJmICWvSqmL9Crl+y5KZSqRyEUQbQeSk7qInJHqvZNFSb4zxIRlo4pYhLaVm+YUzLhfSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145783; c=relaxed/simple;
	bh=0jzrMYG/Zqi4a1LCUXgB/nVmLmrbFykZy+3KzRBvXgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8AydfNxYJvEFbcM3NvL/5Zi44zg/Tu3XLguKxJe5cpji7BahqgGTNVr0IEe/4c4P/bDYiu+cyQqDoNsKSPsNlY2KmFkU1U6jQuWio0OGmqYxJTE7Hjt3Kpjd/FSpocVTkyuzL3JbFVXN97knpIjLgmxLwR8RUwnaFTAvior7mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=arJWV9Uu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="arJWV9Uu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23dd9ae5aacso132985ad.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 04:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752145781; x=1752750581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5JO/Qlx6QEcthLvC0sGmt+qm/PZ0F4XLP2KPhYGX+AQ=;
        b=arJWV9UuylaF1Pzgn2qVQ3quLRFthJYNeTORJa24xbcfHDd2kEM/5oBt9V10tG9Hoz
         9XybwXPZGqZAPv229SXNbEQnEP0ij/K10n5TUNId3cDH9BoyR/EKHWW5PO5psewjBLNv
         sCRvStJRswYyZzJ5An3LnOfS7zQq6zuwJpOwZMBf2Y9CzZ++ZME8B86dbT0p9wTa6miz
         yahc1sBTphHxcML2KGDj97IcRz3XLrqYPqBllG7Yrk4L74aNiknG+kb/NEfsXhS2droH
         f80H1lOb7HaWtkn5A6N7w6gG9fz6J9EBHUM+5CLzCTVtr9l+PPmq1H9Wzts8hewxlrGP
         xnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752145781; x=1752750581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5JO/Qlx6QEcthLvC0sGmt+qm/PZ0F4XLP2KPhYGX+AQ=;
        b=q+HSUsh6l1qCSq2JcrgYUtUvPdUjNKkagIBNguK+ZHXbTVQT7dO+Wj9wVfee/P/rrP
         0GCmhc7cah8ue1QWk4XsS4x+R5ajqSjvSCAESZ9Put2toU30DYVyOjrAW9zGWwf5RfAA
         pTV4fNbvRFTKipGopM1pDcH9/65GJH9ABzXdNTzPPNZVko1RxAUlE0+MV+8kSMVaMRNV
         lp7SpZ5NELHsQF7ydu14oePzyvRG0bgg/oYfzWlFdECixApbhZ7wnYf5QzSLHOGATF+8
         vjs0jbFUcgm1By5OoPPrF5ogXjbV85Mb4/ctohc/zBZ9N+3Hyxa3CsuGWimE6tcx03nK
         /U2A==
X-Forwarded-Encrypted: i=1; AJvYcCXTs0n/DPj/Hjd1WOP3jNLwrDWnR3hLVTiJqbgeFKLevJL604kk2bH5mxbLNWpOLrlEu+EiNB7p8tc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4xejHu5RXjkFCpFRy3hQDc/vjQGBz6bAOh54Zn4sCvAyk5Qjh
	+HiMp99wxfcwcr5O6ey0ASwjx9rpQWPz8tyUwNI8satmCXnJHu2rMe6URPuvUURSfw==
X-Gm-Gg: ASbGncuRRNualSlhEib9L+yjCLOaGyexi3n0lI6KbxhEg0A4bG8beGqShVt35IL/CR+
	9wCx3k7LTA5s7j4MpSXdl7zIxmJGTToPJtyh51/WHIvsv1lacHwhNMUiUST+RMM3a9Z9fVqGk9g
	k2r177LfhTWl0JyRLh1A23COh3PqQadOHBrEbhJPgsPcEZY1E6hRfd6QXS+ziuah67YOOngNFrr
	PB7R5fDiJmPDfRPAB9O/9p9pEqx3DvK26AWRIhixAIUcK0Ye2TNsu1W6zF5z1+eyLFQ6KIlWHyd
	vlbekANq0g6TBICvwRyA04kvztVy5Yt1dyjwMLRm6mb0ssFCPmodngr6rtKEZJddfz6pueRUfMx
	U5V89D2IshcXyC6ilYCu4
X-Google-Smtp-Source: AGHT+IFn1YIIoN9D12OH+6EFBum3x9hdmg0bQvNt4lFk/nH2gQNwHagVfZTJ5ra5fh+Eufg2l4KArw==
X-Received: by 2002:a17:903:120b:b0:237:e45b:4f45 with SMTP id d9443c01a7336-23de4314a3cmr2237805ad.1.1752145776361;
        Thu, 10 Jul 2025 04:09:36 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3007e53fsm4845325a91.19.2025.07.10.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:09:35 -0700 (PDT)
Date: Thu, 10 Jul 2025 11:09:26 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net,
	bagasdotme@gmail.com, will@kernel.org, robin.murphy@arm.com,
	joro@8bytes.org, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, shuah@kernel.org, jsnitsel@redhat.com,
	nathan@kernel.org, peterz@infradead.org, yi.l.liu@intel.com,
	mshavit@google.com, zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v9 22/29] iommufd/selftest: Update hw_info coverage for
 an input data_type
Message-ID: <aG-fZv39ci6yip3z@google.com>
References: <cover.1752126748.git.nicolinc@nvidia.com>
 <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f01a1e50cd7366f217cbf192ad0b2b79e0eb89f0.1752126748.git.nicolinc@nvidia.com>

On Wed, Jul 09, 2025 at 10:59:14PM -0700, Nicolin Chen wrote:
> Test both IOMMU_HW_INFO_TYPE_DEFAULT and IOMMU_HW_INFO_TYPE_SELFTEST, and
> add a negative test for an unsupported type.
> 
> Also drop the unused mask in test_cmd_get_hw_capabilities() as checkpatch
> is complaining.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Note: I see a couple of warnings while building the selftests on Jason's
tree, but these seem unrelated to this series:

make -C tools/testing/selftests TARGETS=iommu
make: Entering directory '/usr/local/google/home/praan/master/iommufd/iommufd/tools/testing/selftests'
  CC       iommufd
In file included from iommufd.c:12:
In function ‘_test_ioctl_ioas_map_file’,
    inlined from ‘iommufd_mock_domain_all_aligns’ at iommufd.c:1789:5,
    inlined from ‘wrapper_iommufd_mock_domain_all_aligns’ at iommufd.c:1757:1:
iommufd_utils.h:679:36: warning: ‘mfd’ may be used uninitialized [-Wmaybe-uninitialized]
  679 |         struct iommu_ioas_map_file cmd = {
      |                                    ^~~
iommufd.c: In function ‘wrapper_iommufd_mock_domain_all_aligns’:
iommufd.c:1766:13: note: ‘mfd’ was declared here
 1766 |         int mfd;
      |             ^~~
In function ‘_test_ioctl_ioas_map_file’,
    inlined from ‘iommufd_mock_domain_all_aligns_copy’ at iommufd.c:1843:5,
    inlined from ‘wrapper_iommufd_mock_domain_all_aligns_copy’ at iommufd.c:1809:1:
iommufd_utils.h:679:36: warning: ‘mfd’ may be used uninitialized [-Wmaybe-uninitialized]
  679 |         struct iommu_ioas_map_file cmd = {
      |                                    ^~~
iommufd.c: In function ‘wrapper_iommufd_mock_domain_all_aligns_copy’:
iommufd.c:1818:13: note: ‘mfd’ was declared here
 1818 |         int mfd;
      |             ^~~
In file included from iommufd_utils.h:11:
In function ‘_test_cmd_get_hw_info’,
    inlined from ‘iommufd_ioas_get_hw_info’ at iommufd.c:792:3,
    inlined from ‘wrapper_iommufd_ioas_get_hw_info’ at iommufd.c:752:1:
iommufd_utils.h:812:37: warning: array subscript ‘struct iommu_test_hw_info[0]’ is partly outside array bounds of ‘struct iommu_test_hw_info_buffer_smaller[1]’ [-Warray-bounds=]
  812 |                         assert(!info->flags);
      |                                 ~~~~^~~~~~~
iommufd.c: In function ‘wrapper_iommufd_ioas_get_hw_info’:
iommufd.c:761:11: note: object ‘buffer_smaller’ of size 4
  761 |         } buffer_smaller;
      |           ^~~~~~~~~~~~~~
  CC       iommufd_fail_nth
make: Leaving directory '/usr/local/google/home/praan/master/iommufd/iommufd/tools/testing/selftests'

> ---
>  tools/testing/selftests/iommu/iommufd_utils.h | 33 +++++++++++--------
>  tools/testing/selftests/iommu/iommufd.c       | 32 +++++++++++++-----
>  .../selftests/iommu/iommufd_fail_nth.c        |  4 +--
>  3 files changed, 46 insertions(+), 23 deletions(-)
>

[...]

> -- 
> 2.43.0
> 

Thanks,
Praan
