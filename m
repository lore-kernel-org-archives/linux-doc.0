Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FBD4279FA
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 06:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978034; cv=none; b=a9cIH+T8m1LI+Ito9f4r99BlGhK+36eelwGWROy8NDYRYLrp1DJpYJzDQNWHXgEDd9yz83+nL+hUWgy+CwxcXq5S3LD3qWV70kRYkAk4USoJc+7fJj3iYUsS9Wwnx2bjQQo5vnkHZ2EuzxBfsTMdSxVFGCWfZRLUrEyEnE33fJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978034; c=relaxed/simple;
	bh=BjEonW32c5YOMq0hqq7Xvkwknsp7bLBK5sRV2QqHoDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2QORB583RaAEtB5mOUejBnWOmK7OV7hLwDXE3nsPfhWK3Sd+x82016bLr79M4isQuf5g+i9opk0zCWmfLugJSB3HHviO1gnheXiM9/MVASTfz5lUUZVkbVnwraQWJwSdPjuwWg69oux+DrLrr8YpMzgoNCnuxBPpfdb+pBw4Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I09yvdCG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I09yvdCG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-501c6665144so63252341cf.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 22:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768978032; x=1769582832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dr4ikofTW2/lOylz+wqvxKyTxo3lmrOIQRlztmAAggk=;
        b=I09yvdCGcAt84e1thV111GI4F5y1Uu+LSjHHcywW9zV4tHt4U/ieciW/cjoyuefS+G
         KmAFKLgdGXgJP0Q91QhLCS5XItA2lzWJMhDiytBPDqzXgnHyTObk5oAvGmluv9Vg/Kyg
         bF0YqcGZkgIdKXSgX7XJ++lT8eurcUHhQRDSZl7i0MKb+3oE1+JrplOcrQSIHwqne1lq
         y2jooqBXNh+g9LUX22i99fMFF98cjpi6Jpvar0xfM5rVPrmC2o18JcVibUxHbOJzHXCc
         g+Ptd2AQnfyyVaM/I9gTRMwYG4TT95im4IBLFDPrP4/zsXtwl0cyaCO/e2vlOQHU63aV
         C5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768978032; x=1769582832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dr4ikofTW2/lOylz+wqvxKyTxo3lmrOIQRlztmAAggk=;
        b=jxpQzMnYOLMGVi/rXhjnFsbVsrvMIYN11qIeXMl6LYkLrgCeDVaEwrlS84uBnOiz1/
         7ei4MJMGc1douXGq9cLWpf0KUzZizL0B1fWo6M539jB77sCVKYJjt0B5WanTWQ6qhscY
         FHFQ+u/laKWQkVu/0Y5lH+A56sRtfF9bD12ZE3OVfxD1VNAE1fAoNdgYa/yoxB63swtZ
         WTSITLaz6TtukQ+mpU1cGsiok6igZ+1MHo3n0fxQa98wFT2rxvekN6Uzji66A506w/ve
         ZH1tigCX4QZcgmBx8Q/dCu80JGVRzKt06SuXFlooaoe/7nvCWxpZix5VhqbXgGFbcuLv
         Ro3g==
X-Forwarded-Encrypted: i=1; AJvYcCV15QlpwauUF/sPG+UGAC1Ib7SV4+nyrJ8SX4JKHL/NKasoublITeicX/xZch+r2W0qS6WQtzZsQRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP8m58zIcpDrTpbK1CiHfzguzrM2cqB7158jTPTMFEiD7uyxh4
	WCefVk/mk8oyGcav2wMBONSpFt1UjlsrKq+BLOQuaFP040RvKAnkQk0V3NxViA==
X-Gm-Gg: AZuq6aKR9+I57UDhYSjVj/kYZRehmnBK45bVz6CvNNBywhcIKNrl6ZKVyIvUQUiegAg
	HU3MQGbIFunrwMcjFOOOR64w+4DZUEs2Cdp2+E54/464siH0mVtsq7S9Sq3Q7Us7oqJHlZLT+Jq
	WcXLTFV4/YMmY0gwobwHQ6uNkg7Qys3qDJiYnJTRiEYVyTxOJmfhQOrMLakJvsBg5jf8vG0XthD
	HPJ+BrvcU0JfMpAUDun4ZAXWD3qZtj41xQL8BgefACatVr21gOxFr1d3HI+FdFyr7JouABwqlrC
	6UC/bcfI9qVLFa6OiM60bFhjGS7bq7F+Dl36Te5V5TegkcTo22V6QOvpiecdh08jYbP0dvRrvfc
	Zyxt/YSej1UmoGIoezEKD1hWD1d+6n3k8W5O0134aiTZN/1J3QHUmEWDYjmOpHizZbK8QyH6nmK
	y4ZUVSZYAcrhJQ7pv+Th5AV0LVxvSHBSaER7w=
X-Received: by 2002:a05:690c:ec4:b0:788:1086:8843 with SMTP id 00721157ae682-793c66b7cd1mr130884437b3.2.1768972588159;
        Tue, 20 Jan 2026 21:16:28 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:74::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c6888b83sm60922327b3.48.2026.01.20.21.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:16:27 -0800 (PST)
Date: Tue, 20 Jan 2026 21:16:26 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: sgarzare@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mst@redhat.com, horms@kernel.org, bobbyeshleman@meta.com,
	corbet@lwn.net, xuanzhuo@linux.alibaba.com, haiyangz@microsoft.com,
	jasowang@redhat.com, linux-hyperv@vger.kernel.org,
	pabeni@redhat.com, kys@microsoft.com, vishnu.dasa@broadcom.com,
	longli@microsoft.com, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	stefanha@redhat.com, berrange@redhat.com, decui@microsoft.com,
	bryan-bt.tan@broadcom.com, eperezma@redhat.com, wei.liu@kernel.org,
	davem@davemloft.net, shuah@kernel.org,
	bcm-kernel-feedback-list@broadcom.com, edumazet@google.com,
	virtualization@lists.linux.dev, sargun@sargun.me
Subject: Re: [net-next,v15,06/12] selftests/vsock: prepare vm management
 helpers for namespaces
Message-ID: <aXBhKlAxxAkvr4/u@devvm11784.nha0.facebook.com>
References: <20260116-vsock-vmtest-v15-6-bbfd1a668548@meta.com>
 <20260121025420.1999992-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121025420.1999992-2-kuba@kernel.org>

On Tue, Jan 20, 2026 at 06:54:21PM -0800, Jakub Kicinski wrote:
> In case you need to respin..
> 
> This is an AI-generated review of your patch.
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> selftests/vsock: prepare vm management helpers for namespaces
> 
> This commit adds namespace support to VM management helpers and wrapper
> functions, requiring callers to explicitly pass "init_ns" for the init
> namespace. The commit message states "No functional changes for existing
> tests. All have been updated to pass 'init_ns' explicitly."
> 
> > diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
> > index c2bdc293b94c..1d03acb62347 100755
> > --- a/tools/testing/selftests/vsock/vmtest.sh
> > +++ b/tools/testing/selftests/vsock/vmtest.sh
> > @@ -135,7 +135,18 @@ del_namespaces() {
> >  }
> >
> >  vm_ssh() {
> > -	ssh -q -o UserKnownHostsFile=/dev/null -p ${SSH_HOST_PORT} localhost "$@"
> > +	local ns_exec
> > +
> > +	if [[ "${1}" == init_ns ]]; then
> > +		ns_exec=""
> > +	else
> > +		ns_exec="ip netns exec ${1}"
> > +	fi
> > +
> > +	shift
> > +
> > +	${ns_exec} ssh -q -o UserKnownHostsFile=/dev/null -p "${SSH_HOST_PORT}" localhost "$@"
> > +
> >  	return $?
> >  }
> 
> The vm_ssh() function now expects a namespace as its first argument, but
> run_shared_vm_test() still calls vm_ssh without this parameter:
> 
>     vm_oops_cnt_before=$(vm_ssh -- dmesg | grep -c -i 'Oops')
>     vm_warn_cnt_before=$(vm_ssh -- dmesg --level=warn | grep -c -i 'vsock')
>     vm_oops_cnt_after=$(vm_ssh -- dmesg | grep -i 'Oops' | wc -l)
>     vm_warn_cnt_after=$(vm_ssh -- dmesg --level=warn | grep -c -i 'vsock')
> 
> When called as "vm_ssh -- dmesg", the "--" is interpreted as the namespace
> argument. Since "--" does not equal "init_ns", the function sets
> ns_exec="ip netns exec --" which is invalid. The shift then consumes "--"
> and the command becomes "ip netns exec -- ssh ... dmesg" which will fail.
> 
> Interestingly, the v9 version of this patch on lore correctly updated these
> calls to pass "init_ns", but this change appears to have been lost between
> v9 and v15. The fix for this regression is present later in the series in
> commit 3ae984505e00 ("selftests/vsock: add vm_dmesg_{warn,oops}_count()
> helpers").
> 
> [ ... ]

Got it, thank you.

Best,
Bobby
