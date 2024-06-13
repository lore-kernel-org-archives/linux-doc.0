Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2A14A62D
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 18:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301642; cv=none; b=d6uipD5x41wkSqVwDSuHafVMWY6j+ZypefRB680oVx0Ym9eA0tnWDCCGd/Af/IbSH+YnWC3zRBg+yZG7pBYuSCjdAfX7uv8ZrTSVMiuvr+2dPVbp5kEto32uCcXQrtuadmv9YQL64ziLY8y2QMIB7Hc5UGmUIbIFXwG3NQGMLJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301642; c=relaxed/simple;
	bh=bMYdPDIxNJ3qhBrWqIO3ZN/KF1PRoqTufoa5UZq514c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pBya3fVV1335YI7aQ4EovbF8fMDNczUDcgP6c5K03cCJj0E4BQIG/FzPw8nKMXYbXsh9TRaEq6v4DrLKPckh6GyiFFYfKdGudwV3ABZ7h/ALUdrgKoIG2sNG65U5thAPeigDANY88VVt4qONK2oUigNiXYFOyA45Pjy54Nf5se0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b4Uve9c7; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b4Uve9c7"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dff151b19f0so150761276.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718301640; x=1718906440; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwOI9B4Rf0kKuFHv5dDa3w4fwvMaD7f4mQqGVSuxMFM=;
        b=b4Uve9c7SxcAoumtv3KhzyhydbfRxh3VGo819luUN5NK/V4hQOJcQrzVzjar8PnTfh
         rbK8wV8xRC62QPI48kIifXA/rRMefNZEeW6PfiR+5MaaNVuqChFBSp0oWjUUB7uGvgre
         ZcDFMyi8CdU5vKBGk6q4bQAyYpnNzoimPhbkf+z0mc4H1Ag05mUWWJWejkXoylbecUJK
         p3Ib5AseD7pl3gKQf5G1OAl+chq55pB2ZofyGXnUiH2Kh+3owIYKGuhAPoXwAdef0HHH
         pKh/rbV7efLz7sAnxrzoTDtmxYrz43sx5czMQdtfkz7UYObC37sRufin6n4uX92qyGEU
         maHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301640; x=1718906440;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwOI9B4Rf0kKuFHv5dDa3w4fwvMaD7f4mQqGVSuxMFM=;
        b=mr5N22mTOOLYWmshvlvWUCWUs2JjFn3RplpO5QxTvpWy2iAmkTkic4Xj2QvRy7rnnz
         OCr60KxFO5T/gVr9TIswOHt2PGYp2aDlYcWYlcHYAwepbEjF0okg1N/Xr2bruTewviZ1
         qjeW2m30GkAHbpOw22pQhef+ZPq08GogBgMGKDzMlPMZTYMK3WP6f/1bd7A6IeAgd84a
         XXyoHMgN6xyu3SDAKjvGx/UkxhYUdVlqF+SC0lqa4aWpWrq+KKXJWpMqhfHMR9Z+FrTt
         K8T8rnJO9T7kNKEgLtHOgZ+jcoRUudRswO0Cu+Y6mo0MmjglLinhRY7jXmqJmJp/Tkbv
         ucuw==
X-Forwarded-Encrypted: i=1; AJvYcCV6aVg5GN30SJeZnbkDYSK2g1pQ/tOIehekWWFVP8rVzhJQkeVWga4L+7uiqLpSOaZvS/ExwKeHAgP3z+1T1hiSY0VE7D5VOh1J
X-Gm-Message-State: AOJu0YwH54dwyG065RKsWoVMXt58fYndiP9F5lXUVM1fRlB77zKmdVi4
	bQ6qjqqWi2PYsBK1zn/X3kcKZEaAsIskJoFm93FBZYLlrpY3KI536lH3mCDOLpmPavWKG5benT7
	9Gg==
X-Google-Smtp-Source: AGHT+IFN8tKIBayasU8DW3XdJWf7PW+lLe7/UIpaOmjMaWPIDA643Amk6HTZzKGnrNvuJ9kWeEpi3On2/s4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1202:b0:df7:d322:97c6 with SMTP id
 3f1490d57ef6-dff154744b2mr21904276.9.1718301640506; Thu, 13 Jun 2024 11:00:40
 -0700 (PDT)
Date: Thu, 13 Jun 2024 11:00:38 -0700
In-Reply-To: <ZjCqFxA+e8g43pCm@chao-email>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-15-xin3.li@intel.com>
 <ZjCqFxA+e8g43pCm@chao-email>
Message-ID: <ZmszxgbIbYSaXyjW@google.com>
Subject: Re: [PATCH v2 14/25] KVM: VMX: Disable FRED if FRED consistency
 checks fail
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Xin Li <xin3.li@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	Ravi V Shankar <ravi.v.shankar@intel.com>, "xin@zytor.com" <xin@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 30, 2024, Chao Gao wrote:
> On Thu, Feb 08, 2024 at 01:26:34AM +0800, Xin Li wrote:
> >Refuse to virtualize FRED if FRED consistency checks fail.
> 
> After reading this, I realize some consistency checks are missing in
> setup_vmcs_config(). Actually Sean requested some infrastructure for
> vmcs_entry_exit_pairs to deal with secondary_vmexit_ctrl.

Yeah, this belongs in setup_vmcs_config(), e.g. to guarantee that discrepancies
between CPUs are detected.  I would also strongly prefer this be squashed with
the patch(es) that introduce recognition of the FRED fields, if only so that we
can avoid "consistency checks" in the shortlog (I thought this patch was going
to disable FRED if a VM-Enter consistency check failed, which would be... interesting).
