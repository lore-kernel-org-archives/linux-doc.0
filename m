Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6229DB86
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 23:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782169296; cv=pass; b=i3p3ZGso4ZYxACV7FClySxH++8HfbcfDvYrUwVaF12dDpfbOPg5fyos8sIlrd3BbuYEVdL9pEuzYuXSo7Cwl7te5Tl2Ht2PSh72SQuuYz89sPCdpexCiBBz2tU7uxjfYkP28yny9YeUKN+7WjGz1bOJErJRgdi6wxfF7hdhh1jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782169296; c=relaxed/simple;
	bh=BWQPMoKQOTeGkRSmowzT6uGFQN8jRHlTD1UMypmkjkw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0RJmPpgi5kY6wSXaw1S0Tg6WEFRyAm5vTsOTKaNlofw4if7q7yr1x3G1TXEhH0m10J/G4kDWrNlw0FCsBhIzqYX27whKhBjrHOZQrme5d3RE2gIdbci32oECSJ0kiWpXEddnbpjomtly2ScMRofhgIdGoPRX+ReSb5yEjGX7Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hQ5ArTg5; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hQ5ArTg5"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1384eb94d20so11946117c88.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 16:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782169294; cv=none;
        d=google.com; s=arc-20240605;
        b=dgu9frA8kaxr45J0lPrBK5h+x2tFKQAUoJuJ6g5eNEJwfaiG1kILayHP2onTpsc2jA
         sOAwLNJ91OMFeJtq01l6VyBszu78NuAphobI5S75F4AccoXeD3AruvkG93WQ5lbi0KGR
         sbWeLR//SZXbUuJt6tk0MlboBssRlrUYrQIWdNWpo/C24nNdes3i3CEVf8yu3F6+mxkB
         T1jb3Gow8yl6meR7+c+Eajkh769Uh3HbQjJ1Uao3hgAdXNCns0dPwcDMWXw4avqW1zFG
         zUl/DLc6SCf5nLuVTjvi3Bx6q8VInY0AscqhWVqrtpCVDsbD82zWKE0IvqwPYJCpnc/l
         7LMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Se78T3ehOJrnIX6EVHqhbA3McVgxD20iSWZ28XYCDdw=;
        fh=zOjyaC08eDoTSTaJ/Tjn8P86DHjf+dGc5flLy8fvT+8=;
        b=VO4MqVwQZ11pUvoqcmxnxLC2/RxC8SJdE2vOZOns/iGePHOUcsnfDD888Nw0blNgDD
         4LMIWIUZjj2fEJk5oLtE9v0ef5/lT5mxB43b7/CQKV02CO/MM5pKwxWJPZwxofHNwgnj
         kX/QYmMx99HF4P8HOHp/gu7dVtfhmRPKAZP03xQeuw6zRi0eKtRCkx/JcN1KPt4SmAYS
         7RWXYuCCIESnZ7OggbSnXzhn7i+3lBCRdLPRn4RajmUulOl4kN2f+9su1WUOjwqV2xV6
         XKMW+zSxpDxkp5Q7acoiuBT6gvkRneYz2xr3AaOUm5ARyFlX8fGM5eN9mfr7AW8AIo4Q
         QF2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782169294; x=1782774094; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Se78T3ehOJrnIX6EVHqhbA3McVgxD20iSWZ28XYCDdw=;
        b=hQ5ArTg5XGxCJHfOdIAcgVkEzKgWkrdxkJbbNGv+gr4IcPaNZhb5VnfCKOLxedvtcP
         zt4e+JVJXVk7YlPldZUftjmYgnKC78UfmkrrRn4ZfgHj2HXK0CbOhAGc9r23qscShAGo
         4gtVTDHZpRydJx0/2FEGhfHtdgFa0+mJrhJ7l7tYqKRp1iDMfmmpbk1BaN4KagbDuyeC
         6DJPPSFqb/n1LK3OhgOdr7Xoj3civzFe0/oSXjigGaQCfF9J0aVWj3CcuTt/adVJC/Qu
         7eMMCiBapIHMdyAZ3Sfweiu2yWkeeEbJ79UYjpShn4823piYNO3LlCAXq8yuljjN2tmf
         zyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782169294; x=1782774094;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Se78T3ehOJrnIX6EVHqhbA3McVgxD20iSWZ28XYCDdw=;
        b=BglihpWwkschs2ZIPUAgTUpL8Uf3Azc/jg/cngCfGh5v4VntpvLgUe2c3MUqNJ7BKa
         q3G88He2E0qj32lplJnkmwzyKJT1/iKkiXlS8uY4nKGQE8osQRcmELBszkEaNSBULyTA
         drRbDys9LWuK+lwi1L715aHa+O1+CYLOoUN5r6Z3QPzfZxv9GJMXTaBl8xv60Y7vC/Iu
         CJgffpEDXI7c88n2rZtIyFDLmkdsibRzXoRGKTub/6xS0QnMY8sbvXs9m1GtpeYozQCX
         BDmLO72hku7elbK5Z1JHoma8niUiGeuLt+IF4ugb5k2DLBqtRq3DLnLCjkqdG1L7neF8
         yzBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AvVuEfGOmAPEe1I8hrrSB+9CK2cb9liSDmfqYbmfvVg5gi3n6sjUr7aN8rNuF1DHBJf7q7Jrs2BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPK4tdWhqYlPLHl73vaEJaQ1dzBs0svMJfbW1i1+2hhbFKP7Fu
	iLtN04A13Gkqqr8/OhZq2bRgFIpfCzCfIu8jFE6kwmT/Fh+GgB+F2wwikEag/SxhvfxDRbPKW+g
	0TTHu8c/jhgSo4utxiExrYvj6Dh5HqJQZJ/1B8yAl
X-Gm-Gg: AfdE7clVPomVTejsnWnj0VprpmrWUj7rNOd2xOpzjXOngpIFnjoKOYyo3pMo7kVm2IY
	pKimjM2XxsJUL4qhitDDbR0s6QdjuCDlgxxzfopG8NpVkjAQ0BcWfcbghAnxfOR4DRVTdRZY8B+
	LDjEES8IUT/mQ6J4ShrL03eBBGnRazturAm8SLk6s4jJ2emHtq2zcJb++PIiy5ol5NtTGS+yR/W
	/rae6JTqkZFgVlLNyJqGW4HPDUilkCBa2ucz+/twLmyY9R0h1JKMEazWy7QIx/cYkN+i89eyaw9
	AAA53NiTqh7DM9uRT4jt3eu8GW9q7ncW67gPLUoVwliMEhwlqy682siagc4=
X-Received: by 2002:a05:7022:78c:b0:137:938a:1044 with SMTP id
 a92af1059eb24-139a216738cmr11302655c88.33.1782169292599; Mon, 22 Jun 2026
 16:01:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:01:31 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jun 2026 16:01:31 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <deb20fbe3584a8c6bfda276447fe464c6553737d.1780676742.git.tarunsahu@google.com>
References: <cover.1780676742.git.tarunsahu@google.com> <deb20fbe3584a8c6bfda276447fe464c6553737d.1780676742.git.tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 22 Jun 2026 16:01:31 -0700
X-Gm-Features: AVVi8Cfmvsh-tLhJUbMrgpAzFVY6IGOEzbMnkY3GArVYdQhVqbDKG-2CuMgaTr4
Message-ID: <CAEvNRgE2GZNiDg_g6SP_H9CDsDDAnpN7KTRWJEK18wxpTZFJZw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/10] selftests: kvm: Add guest_memfd_preservation_test
To: Tarun Sahu <tarunsahu@google.com>, Jonathan Corbet <corbet@lwn.net>, vannapurve@google.com, 
	fvdl@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, sagis@google.com, aneesh.kumar@kernel.org, 
	skhawaja@google.com, vipinsh@google.com, Pratyush Yadav <pratyush@kernel.org>, 
	david@redhat.com, dmatlack@google.com, mark.rutland@arm.com, 
	Paolo Bonzini <pbonzini@redhat.com>, Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>, 
	seanjc@google.com, axelrasmussen@google.com
Cc: linux-kselftest@vger.kernel.org, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Tarun Sahu <tarunsahu@google.com> writes:

> Add a new KVM selftest `guest_memfd_preservation_test` to verify that
> guest memory backed by guest_memfd is preserved properly.
>

Don't think using backticks in commit messages is a common practice but
I might be wrong here.

> The test leverages the Live Update Orchestrator (LUO) infrastructure
> to validate that memory folios and configuration layouts are
> successfully saved and then restored during kernel live updates,
> preventing any memory loss for the guest.
>
> Here, I have used the kvm selftests framework by creating a new
> vm and mapping two memory slots to it. One is the code that is executed
> inside the vm and other is the guest_memfd whose memory is being
> written by the guest code.
>

Don't think commit messages with "I" are common either

> In Phase 1: Once data is written the vm exits and wait for the user
> to trigger the kexec.
>
> In Phase 2: A new vm is created with retrieved kvm and again two
> memory slots are assigned. Once for guest code, and another is for
> retrieved guest_memfd where guest_memfd memory is verified by the
> executed guest code. If verification succeeds, The test passes.
>
>
> [...snip...]
>
> +#define SESSION_NAME "gmem_vm_preservation_session"
> +#define VM_TOKEN 0x1001
> +#define GMEM_TOKEN 0x1002
> +
> +#define GMEM_SIZE (16ULL * 1024 * 1024)
> +#define DATA_SIZE (5ULL * 1024 * 1024)
> +
> +static size_t page_size;
> +
> +/* Deterministic byte pattern generation based on offset */
> +static inline uint8_t get_pattern_byte(size_t offset)
> +{
> +	return (uint8_t)(offset ^ 0x5A);
> +}
> +
> +static void guest_code_phase1(uint64_t gpa, uint64_t size, uint64_t data_size)
> +{
> +	uint8_t *mem = (uint8_t *)gpa;
> +	size_t i;
> +
> +	for (i = 0; i < data_size; i++)
> +		mem[i] = get_pattern_byte(i);
> +
> +	GUEST_DONE();
> +}
> +
> +static void guest_code_phase2(uint64_t gpa, uint64_t size, uint64_t data_size)
> +{
> +	uint8_t *mem = (uint8_t *)gpa;
> +	size_t i;
> +
> +	for (i = 0; i < data_size; i++) {
> +		uint8_t val = get_pattern_byte(i);
> +
> +		__GUEST_ASSERT(mem[i] == val,
> +			       "Data mismatch at offset %lu! Expected 0x%x, got 0x%x",
> +			       i, val, mem[i]);
> +	}
> +
> +	GUEST_DONE();
> +}
> +
> +static void do_phase1(void)
> +{
> +	uint64_t flags = GUEST_MEMFD_FLAG_MMAP | GUEST_MEMFD_FLAG_INIT_SHARED;

Is there a reason to set GUEST_MEMFD_FLAG_MMAP? We're not really
accessing that memory from the host in this test.

> +	int gmem_fd, dev_luo_fd, session_fd, ret;
> +	const uint64_t gpa = SZ_4G;
> +	struct kvm_vcpu *vcpu;
> +	const int slot = 1;
> +	struct kvm_vm *vm;
> +
> +	vm = __vm_create_shape_with_one_vcpu(VM_SHAPE_DEFAULT, &vcpu, 1,
> +					guest_code_phase1);
> +	gmem_fd = vm_create_guest_memfd(vm, GMEM_SIZE, flags);
> +	vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, GMEM_SIZE, NULL,
> +				 gmem_fd, 0);
> +
> +	for (size_t i = 0; i < GMEM_SIZE; i += page_size)
> +		virt_pg_map(vm, gpa + i, gpa + i);
> +
> +	vcpu_args_set(vcpu, 3, gpa, GMEM_SIZE, DATA_SIZE);

If GMEM_SIZE and DATA_SIZE are static I think we don't have to set those
as vcpu_args_set(), they can be used as macros from within the guest.

> +
> +	vcpu_run(vcpu);
> +	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
> +
> +	dev_luo_fd = luo_open_device();
> +	TEST_ASSERT(dev_luo_fd >= 0, "Failed to open /dev/liveupdate");
> +
> +	session_fd = luo_create_session(dev_luo_fd, SESSION_NAME);
> +	TEST_ASSERT(session_fd >= 0, "Failed to create LUO session");
> +
> +	ret = luo_session_preserve_fd(session_fd, vm->fd, VM_TOKEN);
> +	TEST_ASSERT(ret == 0, "Failed to preserve VM file descriptor");
> +
> +	ret = luo_session_preserve_fd(session_fd, gmem_fd, GMEM_TOKEN);
> +	TEST_ASSERT(ret == 0, "Failed to preserve guest_memfd file descriptor");
> +

Thanks for showing how this works :)

> +	printf("\n============================================================\n");
> +	printf("Phase 1 Complete Successfully!\n");
> +	printf("VM file and guest_memfd file have been preserved via LUO.\n");
> +	printf("Tokens: VM_TOKEN=0x%x, GMEM_TOKEN=0x%x\n", VM_TOKEN, GMEM_TOKEN);
> +	printf("Machine Size: %llu MB, Data Size: %llu MB\n", GMEM_SIZE / SZ_1M,
> +				 DATA_SIZE / SZ_1M);
> +	printf("------------------------------------------------------------\n");
> +
> +	daemonize_and_wait();
> +}
> +
> +static struct kvm_vm *vm_create_from_fd(int resurrected_vm_fd,
> +					struct vm_shape shape)
> +{
> +	struct kvm_vm *vm;
> +
> +	vm = calloc(1, sizeof(*vm));
> +	TEST_ASSERT(vm != NULL, "Insufficient Memory");
> +
> +	vm_init_fields(vm, shape);

What would happen if the shape was changed between preserving and
restoring?

> +
> +	vm->kvm_fd = open_path_or_exit(KVM_DEV_PATH, O_RDWR);
> +	vm->fd = resurrected_vm_fd;
> +
> +	if (kvm_has_cap(KVM_CAP_BINARY_STATS_FD))
> +		vm->stats.fd = vm_get_stats_fd(vm);
> +	else
> +		vm->stats.fd = -1;
> +
> +	vm_init_memory_properties(vm);
> +
> +	return vm;
> +}
> +

I think vm_create_from_fd() could be introduced in an earlier patch to
reduce the amount of new code in this patch. Also, I think it could
perhaps be moved to kvm_util.c assuming that other test will use it too.

> +static void do_phase2(void)
> +{
> +	int retrieved_vm_fd, retrieved_gmem_fd, dev_luo_fd, session_fd;
> +	struct vm_shape shape = VM_SHAPE_DEFAULT;
> +	const uint64_t gpa = SZ_4G;
> +	struct kvm_vcpu *vcpu;
> +	const int slot = 1;
> +	struct kvm_vm *vm;
> +
> +	dev_luo_fd = luo_open_device();
> +	TEST_ASSERT(dev_luo_fd >= 0, "Failed to open /dev/liveupdate");
> +
> +	session_fd = luo_retrieve_session(dev_luo_fd, SESSION_NAME);
> +	TEST_ASSERT(session_fd >= 0, "Failed to retrieve LUO session");
> +
> +	retrieved_vm_fd = luo_session_retrieve_fd(session_fd, VM_TOKEN);
> +	TEST_ASSERT(retrieved_vm_fd >= 0, "Failed to retrieve VM file descriptor");
> +
> +	retrieved_gmem_fd = luo_session_retrieve_fd(session_fd, GMEM_TOKEN);
> +	TEST_ASSERT(retrieved_gmem_fd >= 0, "Failed to retrieve guest_memfd file descriptor");
> +
> +	vm = vm_create_from_fd(retrieved_vm_fd, shape);
> +
> +	u64 nr_pages = 2048; /* 8MB is plenty for slot0 pages */
> +

I don't think declarations are usually mixed with regular code.

> +	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, 0, 0, nr_pages, 0);
> +	kvm_vm_elf_load(vm, program_invocation_name);
> +
> +	for (int i = 0; i < NR_MEM_REGIONS; i++)
> +		vm->memslots[i] = 0;
> +
> +	struct userspace_mem_region *slot0 = memslot2region(vm, 0);
> +
> +	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
> +
> +	vm_set_user_memory_region2(vm, slot, KVM_MEM_GUEST_MEMFD, gpa, GMEM_SIZE, NULL,
> +				   retrieved_gmem_fd, 0);
> +
> +	for (size_t i = 0; i < GMEM_SIZE; i += page_size)
> +		virt_pg_map(vm, gpa + i, gpa + i);
> +
> +	vcpu = vm_vcpu_add(vm, 0, guest_code_phase2);
> +	kvm_arch_vm_finalize_vcpus(vm);
> +
> +	vcpu_args_set(vcpu, 3, gpa, GMEM_SIZE, DATA_SIZE);
> +
> +	printf("Resuming / Running VM in Phase 2...\n");
> +	vcpu_run(vcpu);
> +	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_DONE);
> +
> +	printf("\nSUCCESS: Phase 2 Complete! All 5MB complex data verified intact!\n");
> +
> +	luo_session_finish(session_fd);
> +	close(session_fd);
> +	close(dev_luo_fd);
> +	/* This will also close the vm_fd */
> +	kvm_vm_free(vm);
> +	close(retrieved_gmem_fd);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	bool phase2 = false;
> +
> +	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> +	page_size = getpagesize();
> +
> +	for (int i = 1; i < argc; i++) {
> +		if (strcmp(argv[i], "--phase2") == 0)
> +			phase2 = true;
> +	}
> +

Maybe use getopt() here?

> +	if (phase2)
> +		do_phase2();
> +	else
> +		do_phase1();
> +
> +	return 0;
> +}
> --
> 2.54.0.1032.g2f8565e1d1-goog

I think we also need tests for trying to allocate while frozen, and
conversion while frozen, and trying to preserve while preservation is
not allowed.
