Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59EB3EB7F8
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819830; cv=none; b=M1kBcQ+5IuwAauMkUxW81MlMRUc79YS81Hn3ALt3aanxXM+qGgjAbMxj8p8ibGYdpHBo52AL+9CqtmZlAjwZbakyHQp/pion7/LLQJaC99zX4b0JoaOs24NYrnAHfoJoR8cmaX+DiDvWv4QJqw6sslmEuCpat8YnD/AoW6+ARDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819830; c=relaxed/simple;
	bh=WWlbrGlwzw3DDhymHIEEbql2bhuXCDc1wEEB5h2/KM8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F9xbDLMJck2FGpoX1ydx7VlU2WK19gxH8RDV/Lol5+hOajTMgWciaFwQP7wXYoA9Y+G42e+rtPGcFyHSFD8fqTcHnejEsppgxVqwpIUlvL9ab96KofRKX2DBbO3kdSawr5gq6v7XEnWJunu/LOOABU1/g29MyUPiIPyg4CAs228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9w1LjK7; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9w1LjK7"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso108959a12.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819825; x=1788424625; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LxZheOU3heq1Rt2uci8mom6QvWxLgzl/sBJmkwWwCSE=;
        b=L9w1LjK7SvxzYYQehtOJZ+WbdJGHCVAcbEdTZxCwTn0xNoMo6aZlLPcSxX1Rj0xOdn
         /pBjEPKDA5HrH6B+Rg/ao5dA8ToceeTADuqvPNwgA7Q8+Ny+/NSZiUrfywhzhQ8JHyOu
         CKw9ENDpC8DByEGCstGzvNmnprAo2EZRfppWIvDnWiPAmRCGVFvkynM4vLwYFRkbM6q8
         YjzU5GYViFQdzcDVoZOgiaqzpWWuiawdHVtuzj3M9QjYp83xBU25OcyshXJacpS86/Ys
         jq0Ax8jJDtSjLzrfDP11xYPwNPUdyU96hpdVvgZ1F3hYMw3K1ySNpeQC0okKYgp2f33u
         c9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819825; x=1788424625;
        h=content-type:mime-version:user-agent:references:in-reply-to:subject
         :cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LxZheOU3heq1Rt2uci8mom6QvWxLgzl/sBJmkwWwCSE=;
        b=rtuNsga3y2hM4jjAxB6cR8ZA8uGPaptGWyO7vDzCPOXyeGXls+QB+fB8Bg59fK5VWz
         uKr865mRKfGKlsmjy6La4Zz0H+5Ps3+CguiVFKVC5sIl0L0EMO2Mn9wOK0zbGQWKNaeD
         yjE+vKB39DR6dz8v77YpLcKS8Kcp9f67peFEADd5kzJvXFPyW2FvQKqLYEkM0h3NSH8x
         1uXSNu8adcKUXmm9kiWkryTBG3JmNz1f9SgDNcCohr2qJodcAA+ziZPfw3FR/hQ2JUdn
         bk3tBJ4pK/Py4o9v5N/N3TfQZCRPeC54ixhFmJnIEb5TSCsldTH/nuqJHh8fgXeH64Eu
         e5Rw==
X-Forwarded-Encrypted: i=1; AHgh+RoD6AHqcT0DxIfEAqMhhLalTM8LNiFapLbqePwA/8CANZ52y+OFesRC0m8ugddel0ztFKYHgveXxTY=@vger.kernel.org
X-Gm-Message-State: AFuF++mKL+E399wNEhO4o5LH3RAx0QftlFbIUnt2z7B9YhbnmfLNq7eS
	9nQD1sl82VDu1quSwFOWTt7pUwnmq+udzD8TKKK6VrGA9oFWvyjyNqsA
X-Gm-Gg: AR+sD11Crh36AoTqr3OCRWAoZf0xUIzGdd6ge3gWhEnrvvplFrX23o0cZr2YNj9EeWt
	fIE3qleZelkJzPl1d3I78/SWAFtxzKwy3gnxOVJ0TXycgP0vFaammiLOIMFMNR/ELQ7QYEfeq/g
	Vo088VRsJ5iz1MMMB7Dvxnrr9XTBLe6NfZWip3p0oiUfRMkliORc3jFVpBrnZK7Unsfpzjlec0J
	ImOXo1MJoGHm15YldLb8GmoV5uoL7ediEpMvdvcqoHXRRX+O/0jNJFhsXwlOM368ZhcmazLkNlN
	NFXsD1IkYT0tcr+4Jfti3nPz1QRhtNfIghT13XHYn3yzOlYdzjqODJ9AWxTqRqac7Ua9/oCgKPy
	yWtwZ7zNBUMcXmvYrSnmL7z69pv3dsvWKg0jx8RuOQI2W1rpd7USsAmc5U/AtDREVjsKVW7M9/U
	EF/xNBz4pxUX+ReJ6/gu3FS2pl/D6lxiC8c2yvDuytaG3WaEhHOlkeE1XNSqxiNmjVPbQKDg3FM
	kQrwznUVThx/MhNY1wfkOsDv93iyrbIO2c5hqVhSsEnChCpNaGYaMkz6EQFk21bEoVK7bc0tV+Y
	sXDxIA==
X-Received: by 2002:a05:6a21:4593:b0:3bf:9b61:f7ae with SMTP id adf61e73a8af0-3cf8413dffdmr30029671637.14.1787819825412;
        Thu, 27 Aug 2026 01:37:05 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1beae53e5sm1898674a12.7.2026.08.27.01.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:37:04 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:36:59 +0900
Message-ID: <m2zey8ufh0.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: ljs@kernel.org
Cc: linux-mm@kvack.org,
	liam@infradead.org,
	rbm@suse.com,
	akpm@linux-foundation.org,
	luto@amacapital.net,
	brendan.jackman@linux.dev,
	david@kernel.org,
	liuhangbin@gmail.com,
	corbet@lwn.net,
	kees@kernel.org,
	broonie@kernel.org,
	mhocko@suse.com,
	rppt@kernel.org,
	shuah@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	wad@chromium.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-um@lists.infradead.org,
	geert@linux-m68k.org,
	daniel@thingy.jp
Subject: Re: [PATCH v2 1/2] selftests: run tests on nommu architecture
In-Reply-To: <ao2aTD1ZGObPfp4T@gremlin>
References: <20260825015945.141739-1-thehajime@gmail.com>
	<20260825015945.141739-2-thehajime@gmail.com>
	<ao2aTD1ZGObPfp4T@gremlin>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII


Hello,

On Tue, 25 Aug 2026 22:36:22 +0900,
Lorenzo Stoakes (ARM) wrote:

> > diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> > index 311811dc55a0..7287d8290b6c 100644
> > --- a/tools/testing/selftests/kselftest/runner.sh
> > +++ b/tools/testing/selftests/kselftest/runner.sh
> > @@ -38,8 +38,12 @@ tap_prefix()
> >
> >  tap_timeout()
> >  {
> > +	# nommu doesn't support timeout command (missing fork(2))
> > +	if [ "$NOMMU" = "1" ] ; then
> > +		echo "timeout isn't supported for nommu"
> > +		$1
> >  	# Make sure tests will time out if utility is available.
> > -	if [ -x /usr/bin/timeout ] ; then
> > +	elif [ -x /usr/bin/timeout ] ; then
> >  		/usr/bin/timeout --foreground "$kselftest_timeout" \
> >  			/usr/bin/timeout "$kselftest_timeout" $1
> >  	else
> > @@ -130,6 +134,7 @@ run_one()
> >  				return $KSFT_FAIL
> >  			fi
> >  		fi
> > +		OLDDIR=$(pwd)
> >  		cd `dirname $TEST` > /dev/null
> >  		(((( tap_timeout "$cmd" 2>&1; echo $? >&3) |
> >  			tap_prefix >&4) 3>&1) |
> > @@ -147,7 +152,7 @@ run_one()
> >  		*)
> >  			ktap_test_fail "$TEST_HDR_MSG # exit=$rc";;
> >  		esac
> > -		cd - >/dev/null
> > +		cd "$OLDDIR" >/dev/null
> 
> Hmm, why are you changing this bit?

on nommu we cannot use /bin/bash (i.e., no fork(2) so, we use
/bin/hash, a busybox-offered shell with vfork.
with this `cd -` (standards specified) isn't implemented due to slim
requirement of that shell (I suppose, miserable...).

thus this workaround.

> >  	fi
> >
> >  	return $rc
> > diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> > index 261e4df94d9d..0d05946a5e7a 100644
> > --- a/tools/testing/selftests/kselftest_harness.h
> > +++ b/tools/testing/selftests/kselftest_harness.h
> > @@ -1274,6 +1274,10 @@ static int test_harness_run(int argc, char **argv)
> >  	unsigned int count = 0;
> >  	unsigned int pass_count = 0;
> >
> > +#ifdef CONFIG_NOMMU
> 
> Let's not prefix with CONFIG_ :) I think this is pretty confusing vs. the kernel
> CONFIG_xxx flags, esp. as this obviously inverts CONFIG_MMU.
> 
> maybe just 'NOMMU'?

thanks, I will remove CONFIG_ part.

initially I was trying to pull generated/autoconf.h into kselftest but
it doesn't do much compared to many modifications (run_kselftest.sh
needs to run independently from build tree) so, I used this macro but,
yes, it's confusing.

> > +	ksft_print_header();
> > +	ksft_exit_skip("kselftest harness requires fork(2), unavailable on NOMMU\n");
> > +#endif /* CONFIG_NOMMU */
> >  	ret = test_harness_argv_check(argc, argv);
> >  	if (ret != KSFT_PASS)
> >  		return ret;
> > diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> > index f02cc8a2e4ae..fdb895967768 100644
> > --- a/tools/testing/selftests/lib.mk
> > +++ b/tools/testing/selftests/lib.mk
> > @@ -97,6 +97,14 @@ TEST_GEN_PROGS := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS))
> >  TEST_GEN_PROGS_EXTENDED := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS_EXTENDED))
> >  TEST_GEN_FILES := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_FILES))
> >
> > +# detect if users request NOMMU build or not
> > +# User can set NOMMU to 1 to build/test for NOMMU platforms
> > +NOMMU ?= 0
> > +ifeq ($(NOMMU),1)
> > +CFLAGS += -DCONFIG_NOMMU
> > +export NOMMU
> > +endif
> > +
> 
> I wonder if this could be put into testing/selftests/nommu/something.mk? Though
> I guess would have to be included for all builds to account for nommu trying to
> build any kind of tests.

yes, in addition to moving to selftests/nommu this can be more cleaner
initial introduction of this target.

thanks for reviewing.

-- Hajime
