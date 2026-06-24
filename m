Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C33CD8BF
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 19:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782330913; cv=pass; b=RzKgMT8Po4Cwc9JquWXhMnHJHx30iHxrq9cC+MrjQei1gKdKK+nQhMAEKVLsvwS8ybemjDXDQ8GItkzcnTvbkCw5xN9Li0AnsixnEtYfVo8ejrEZlvaz4BcOXUCSx7BzDQSzZcxWRAeoUz8sZWaSCxBLIb16e2d+8l+VnugLIgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782330913; c=relaxed/simple;
	bh=W1Q1ZIS1tK0GuoWOs7eGstZIyMHoTFwb+9lbpX5rjyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZxuMMqNuNMA7YdVE35Z84PWysC+EouSDQ9syH5DPB/I+/j9oSP1SV1+RIOVJtgS1SkR8RlxFWUSxrksp4rQP5ibIect8ccfgS479AQ3x7N41aEU0uZVT/SozLduoBYGXJS6RqRRu/Qr1TS4av61gSNGS0zHFzrgxyd6oTvTLSlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u88ghblW; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u88ghblW"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51765331535so5501cf.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 12:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782330911; cv=none;
        d=google.com; s=arc-20260327;
        b=SZRswnNBV2G9iwu5gJhKQhyfaFSmL6Dd2bDv922oiJ6l+UIp+qGV2gUHtr7Rs+FN92
         w3+bv8JCESwswrad1Q7CNR3F42l0oJJnnxwA/j4abjTMdZsC2aLnFbWV/Ru8a1svXjwM
         Vn+TQBz7gETp3rX+7rekmgsP/gRrTjqs6g/i65M9wP1UbzKNQfiR1eFDC9ccTZm3h75s
         16HcW2B7jzHFcC2rbC192R8HCTb3K607TEfRfg1KkYo94oX8Eh6AnABPeJVChCgDBl2A
         mP4JAKICS+1Fe4bILX05CmKD2/Y7NmNPhNDrzmPr3sj1SWaiKUsCd8WpfzcUSmZb9ZAV
         85SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CJJECXfHWYzxy9+jrHC2YkFB6UtBZdMEUotYUUXmsS8=;
        fh=jCKj8fJZK2zIoWSHvSehEBA99LCcVVm4hHvbsvNqk60=;
        b=SYss+HbWf0ANO5wdIbRGvSEUzfpxQ/tpcyVeIhofUsAvn4qd2u4uJO3P+NHEun/e7F
         6u4oG7Qgvtp0WvvsxK7AKjq/TPj6y2tfThcTKNYmONoAW4nxy+48UXUMh208ravDQ+Ij
         DOoXWpMWqEpH9yqLhwxoQeZDsDX6TkjRNoZZRd/dTQB6l9XLY/chVHiqQ0gE+dGuE74n
         5Gh9VCdgrasUKaoyK+sBaOCPVE4WLyV736knn4gqwPZsC9wXSfIbiSr36T3/LIwVBWHq
         0SWUNeovXTtKpnRLoxxY/JmfiLu4OXRD7BAOKD0ji+Hp6NgMzxPFYtXPO9axUnVmU46p
         DKEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782330911; x=1782935711; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJJECXfHWYzxy9+jrHC2YkFB6UtBZdMEUotYUUXmsS8=;
        b=u88ghblWcDIJy7sCqIB+kDikcIp1+N9y77kM3Pn3I+4sWYhcj5BgH36Kn/H4o/7XsN
         SIRCwC7LvAjVVgln5oxI0wz46pEi+sVJOHXv6phWtgPfRsatOkaeN8pjBFf+L3atHlJx
         lRWXa9QMTLHbTDtgYiEe6rYhdHseB+aBFbQutILmAGN+O0dB5Mq3tU1sCWL7saH4S2QC
         DhkcmPtvnlJL8WjMjEao2eu3cRv8AKgYwA9LQS4Fw4veJploJ3xcbYjL0z/j9eWMZqGV
         jjxnyR4NYgL/GkHbUXS8mcL/DzfUdmO/ZSBgxcu3qD+Gi/s0MXAKBCMljNJI95FWh1c2
         4eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782330911; x=1782935711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CJJECXfHWYzxy9+jrHC2YkFB6UtBZdMEUotYUUXmsS8=;
        b=iqezBZcxEnmB5MW6jnXu9bYVbyosXqn/D1PWPh94r0VD8VxYeNX+oUFOVG/D8G6N99
         K93NeyylSZYjdmyZHOuoqcRZzYwbb7SetiwZ8UQS/jg/gAPBeDcTtYBgmGDAxtEADzxX
         5GgJX646Rvt+MIHPPfnmwIyGC+L/ZNRiaAvSTiHDnzGeXc/STJcWmAcoaj5R3od3fKtl
         1siF0QPKDyPD+UpN5WYBqVfAy0qJycCE2TG5G2EgMiuBp13KRLzBbVhUlzQNeLvmkztA
         YgJ73afmmb+Zpxf3YPVWJh7SwLR5cRFvKl0BUZutkfeowb+SWK2QCGDN/sJmFqV7N96t
         Rx1g==
X-Forwarded-Encrypted: i=1; AFNElJ/G2BH4HIG6LCVX2ZxacIpeOGnOjWhHP/ovMutuIwt4Pl+fs+erZygTM+9muqKGm1Qu4/lyAadVt4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR98zo5yAZNViBDQ3gxXFSO5MhKHHhud6QBeGGWpFtDBtdafHY
	xFUq/PYayzjvyLVPHgfzKeQa5Y6Auh8w4enTkpN2nhFJ68BhTFaIv1k8lagWSJ7jiMSlzWMDMmI
	NbZLvk4kBZ84onsochDoPA4/cewFahluL8TRCDSft
X-Gm-Gg: AfdE7ckThL+qZOHpE6V16r/7mHjvSNhU9cTGQ8YiO/JxAxd19x8jhFHgbiXAqFjeu1i
	GG4JuZauNlOMGREhvr8HEv3Bm06/cBCljg1yyYSAYUTvfsELdxsutekBBmV+cy1OfTBNxqW2paV
	LjLuSx6Y3qGb0cGY7w3uwfEhHA0cja13++qY1SMrhUeJXNid5N/YwYS9+PW/uB4uGNh8889Hn+1
	NZ8j3KUTTYT1xSWldQXArKegqVEJzm79X6d3TDg0m/W7WmCGbL4WwTtlth7x/pdMBXxuDHHrQ==
X-Received: by 2002:a05:622a:64a:b0:519:df4f:6c93 with SMTP id
 d75a77b69052e-51a6ebb200dmr1920671cf.20.1782330909527; Wed, 24 Jun 2026
 12:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-32-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-32-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 24 Jun 2026 20:55:00 +0100
X-Gm-Features: AVVi8CdkNL-Bi4CuQeJBlP58vmddsTQ61Xm1xaJ4QXqFxTKdTVP42Qqva81y8NQ
Message-ID: <CA+EHjTwJYQmg6oTU49ObF5fQCThghn+TMau=g5zUP8w_KLuiKQ@mail.gmail.com>
Subject: Re: [PATCH v8 32/46] KVM: selftests: Test conversion flow when INIT_SHARED
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> Add a test case to verify that conversions between private and shared
> memory work correctly when the memory is initially created as shared.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  .../testing/selftests/kvm/x86/guest_memfd_conversions_test.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> index 8e09e241723e5..5b070d3374eae 100644
> --- a/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> +++ b/tools/testing/selftests/kvm/x86/guest_memfd_conversions_test.c
> @@ -95,6 +95,12 @@ static void __gmem_conversions_##test(test_data_t *t, int nr_pages)          \
>  #define GMEM_CONVERSION_TEST_INIT_PRIVATE(test)                                        \
>         __GMEM_CONVERSION_TEST_INIT_PRIVATE(test, 1)
>
> +#define __GMEM_CONVERSION_TEST_INIT_SHARED(test, __nr_pages)                   \
> +       GMEM_CONVERSION_TEST(test, __nr_pages, GUEST_MEMFD_FLAG_INIT_SHARED)
> +
> +#define GMEM_CONVERSION_TEST_INIT_SHARED(test)                                 \
> +       __GMEM_CONVERSION_TEST_INIT_SHARED(test, 1)
> +
>  struct guest_check_data {
>         void *mem;
>         char expected_val;
> @@ -186,6 +192,12 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(init_private)
>         test_convert_to_private(t, 0, 'C', 'E');
>  }
>
> +GMEM_CONVERSION_TEST_INIT_SHARED(init_shared)
> +{
> +       test_shared(t, 0, 0, 'A', 'B');
> +       test_convert_to_private(t, 0, 'B', 'C');
> +       test_convert_to_shared(t, 0, 'C', 'D', 'E');
> +}
>
>  int main(int argc, char *argv[])
>  {
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
